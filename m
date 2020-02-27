Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DBC1727F7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBB56ECC1;
	Thu, 27 Feb 2020 18:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690048.outbound.protection.outlook.com [40.107.69.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4585D6EBFA;
 Thu, 27 Feb 2020 18:48:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRbedbXKK7VV/dOhuywAHuO7PMDsYjf5rmAxkggoOp7yp7WcVp1qhVXPbzF0w+knqTq6KNAl5u1pxHOIqHePEqGiVT/eE/DJ79qPbn6EvFHpFZECqkb2L9VYlY82s7ezILKwF+O/13sOQi1kHUdAMqY+62JWLyBv84Lu37jRgRTauKcoDmr07ahyFoElzTRsrUaaV3zuEQereDYl66soKO4kCGjqgEBmr02l9F5KcFgs/7nSNPvAE3qGQagED1rIN8CKgUnRYs3uRM3ryO1UUzne8/fx2Fx4bcXHS0YjQnq/ZEjnC3+vtruJoIQV0I0FU3vWPI31AdbHAOBEO2E4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqAmKewSwjbt4PpcORodUeg5KR8XOhPiQyAVZR+Z3RY=;
 b=NQ1JMFtLqd+B1VjSj26ppWdYUMmQxAZ0OJBniD+UfLBhAiqsofdhyJGEPURgfArWmAFw97l7Z8P+eKx9IPL92Pyq1qzYeTs6Uf6WetfjzK/VMzRQexpiQT8T7OjBZhZMVHAyuB2rI5Ur6X9FiJZGi4cBEgeEC7QGtYFLvSUo1P2VtpP6kwSTwTO+mZUKYYni+tKxVYfEdFvAZLoImLRqQORYo9UG5TjTP5K1vn+o/GRgoYYjcUetlvs7BbLpuIkhursD7PQ7dCqZG5Ckn3nhFYRhlAK/u1Wju8f5exjDqVyzUsXpEg3/IYamvVUdSJnl+o+Dsa3YUvkBSUXBov/nlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqAmKewSwjbt4PpcORodUeg5KR8XOhPiQyAVZR+Z3RY=;
 b=4ESLdAcSfoPYT7IOYzyQrmVzCSBcUZQ/9KZaYbKoHoPcRb7lIZ81hL8ASx73BLyrjtO5r5HQJCOdssFxaxcOnZH23n1lUGxEJYb0V3ze1vbHvlmBPYnIaMChvGo6F9zf1sJs5szWvYiTLAfCB/X58hhFKZYBuesBN+SYbb9H7+w=
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com (2603:10b6:3:ec::14)
 by DM5PR1201MB0268.namprd12.prod.outlook.com (2603:10b6:4:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Thu, 27 Feb
 2020 18:48:41 +0000
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51]) by DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51%5]) with mapi id 15.20.2750.024; Thu, 27 Feb 2020
 18:48:41 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "Liu, Zhan" <Zhan.Liu@amd.com>, Melissa Wen <melissa.srw@gmail.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: RE: [PATCH 2/2] drm/amd/display: dc_link: code clean up on detect_dp
 function
Thread-Topic: [PATCH 2/2] drm/amd/display: dc_link: code clean up on detect_dp
 function
Thread-Index: AQHV7PFJrzsxO38xA0qqdJAhaAZqgqgvYCNQgAACWBA=
Date: Thu, 27 Feb 2020 18:48:40 +0000
Message-ID: <DM5PR1201MB2554FCEFFDD68D74FFE2DEDF9EEB0@DM5PR1201MB2554.namprd12.prod.outlook.com>
References: <cover.1582752490.git.melissa.srw@gmail.com>
 <9961afca2cf831ac688025a63b7cd35dd0908fac.1582752490.git.melissa.srw@gmail.com>
 <DM5PR1201MB25540271F42D8034FB2611829EEB0@DM5PR1201MB2554.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR1201MB25540271F42D8034FB2611829EEB0@DM5PR1201MB2554.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7ba8a28e-6fad-4170-c0bf-08d7bbb5a9e9
x-ms-traffictypediagnostic: DM5PR1201MB0268:|DM5PR1201MB0268:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB02685FA8E206FADF572E3F889EEB0@DM5PR1201MB0268.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(189003)(199004)(186003)(6506007)(26005)(478600001)(54906003)(71200400001)(53546011)(316002)(2906002)(7696005)(86362001)(110136005)(33656002)(5660300002)(8936002)(81156014)(55016002)(66446008)(76116006)(9686003)(64756008)(4326008)(2940100002)(8676002)(81166006)(66476007)(66556008)(66946007)(52536014)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0268;
 H:DM5PR1201MB2554.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iINNV0Q+VopZhRro/fEQqb47khKedVA8pG841HndeRa9AD7XA+u1jgLDkTG9e6z3DAVxvI86BMAeQz6RMKYrLdP2GkON87OZ62qOCQ6pjsxQIRG1oENa408tbHYIdx6zfDW60NE7hOmJtwqs5LhD8koZ8FZqtbvwZws2XPPCWNqncu/Q5qo4tYOD0FXLUCxFz1ileyhNVklTr0TGKcqzm3tAkBfiH49OMZvAByYXSZHhI3g3+CJWAtB/9//NkY8qjuBEQf/xwG4H9x8kIJupEjHngIar+/9Dp0cwHb3ocjEcjFmNAItEhWJqwFUOHRPk3hAvqeYiGMyio3XGNajIwQsCZalkgdIqYwQ6I3lfHQ530A5KSpnFgp2QBqdMweHWcB65ScwPWU2I8QqQBQlD5lz0tOR8Ylnjq1q9LhRVerr6N9a1zUCODlFY8FJ4RzgDSiKJ5vIA/m/8kCUY7UpALe/Sxa1sKkVjIk9E/9R+7+vmf9jwgT9i+WNf99uFzG/T
x-ms-exchange-antispam-messagedata: 5adomc7QC6AQtvxXs9vuH+rf/MSPpCb4Faa7kCkvE7cx/6FwZYSxwOmOuen0AN3F+xNjHI5Vluf8+blsUB9N0q8xTSQTUvZpM+r0olJBYIMrcLkqsWjd44gk3IuB654J9qcuV6Q6e4CJQZ0cZR5I0w==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba8a28e-6fad-4170-c0bf-08d7bbb5a9e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 18:48:40.8878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B0fO4DYjp3h9J/j75ZIXZQICPmgl+xWQn3DfiNRPDTK2kTMOg1J8LBQ+ZSU8GS+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0268
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Liu,
> Zhan
> Sent: 2020/February/27, Thursday 1:40 PM
> To: Melissa Wen <melissa.srw@gmail.com>; Wentland, Harry
> <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH 2/2] drm/amd/display: dc_link: code clean up on
> detect_dp function
> 
> 
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Melissa Wen
> > Sent: 2020/February/26, Wednesday 5:08 PM
> > To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> > <Sunpeng.Li@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>;
> > Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> > <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> > <daniel@ffwll.ch>; Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > linux- kernel@vger.kernel.org
> > Subject: [PATCH 2/2] drm/amd/display: dc_link: code clean up on
> > detect_dp function
> >
> > Removes codestyle issues on detect_dp function as suggested by
> > checkpatch.pl.
> >
> > CHECK: Lines should not end with a '('
> > WARNING: Missing a blank line after declarations
> > WARNING: line over 80 characters
> > CHECK: Alignment should match open parenthesis
> >
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> 
> Thank you Melissa for your contribution! Will apply it.
> 
> This patch is:
> Reviewed-by: Zhan Liu <zhan.liu@amd.com>

Sorry I didn't see Rodrigo already replied your email. Please send us a V2, then we will review your V2 patch.

And again, thank you so much for your contribution!

Zhan

> 
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 35
> > +++++++++----------
> >  1 file changed, 16 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > index 0f28b5694144..adb717f02c9c 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > @@ -585,14 +585,14 @@ static void
> > read_current_link_settings_on_detect(struct dc_link *link)
> >  		LINK_SPREAD_05_DOWNSPREAD_30KHZ :
> > LINK_SPREAD_DISABLED;  }
> >
> > -static bool detect_dp(
> > -	struct dc_link *link,
> > -	struct display_sink_capability *sink_caps,
> > -	bool *converter_disable_audio,
> > -	struct audio_support *audio_support,
> > -	enum dc_detect_reason reason)
> > +static bool detect_dp(struct dc_link *link,
> > +		      struct display_sink_capability *sink_caps,
> > +		      bool *converter_disable_audio,
> > +		      struct audio_support *audio_support,
> > +		      enum dc_detect_reason reason)
> >  {
> >  	bool boot = false;
> > +
> >  	sink_caps->signal = link_detect_sink(link, reason);
> >  	sink_caps->transaction_type =
> >  		get_ddc_transaction_type(sink_caps->signal);
> > @@ -606,9 +606,8 @@ static bool detect_dp(
> >  			sink_caps->signal =
> > SIGNAL_TYPE_DISPLAY_PORT_MST;
> >  			link->type = dc_connection_mst_branch;
> >
> > -			dal_ddc_service_set_transaction_type(
> > -							link->ddc,
> > -							sink_caps-
> > >transaction_type);
> > +			dal_ddc_service_set_transaction_type(link->ddc,
> > +							     sink_caps-
> > >transaction_type);
> >
> >  			/*
> >  			 * This call will initiate MST topology discovery.
> > Which @@ -637,13 +636,10 @@ static bool detect_dp(
> >  			if (reason == DETECT_REASON_BOOT)
> >  				boot = true;
> >
> > -			dm_helpers_dp_update_branch_info(
> > -				link->ctx,
> > -				link);
> > +			dm_helpers_dp_update_branch_info(link->ctx, link);
> >
> > -			if (!dm_helpers_dp_mst_start_top_mgr(
> > -				link->ctx,
> > -				link, boot)) {
> > +			if (!dm_helpers_dp_mst_start_top_mgr(link->ctx,
> > +							     link, boot)) {
> >  				/* MST not supported */
> >  				link->type = dc_connection_single;
> >  				sink_caps->signal =
> > SIGNAL_TYPE_DISPLAY_PORT; @@ -651,7 +647,7 @@ static bool
> detect_dp(
> >  		}
> >
> >  		if (link->type != dc_connection_mst_branch &&
> > -			is_dp_active_dongle(link)) {
> > +		    is_dp_active_dongle(link)) {
> >  			/* DP active dongles */
> >  			link->type = dc_connection_active_dongle;
> >  			if (!link->dpcd_caps.sink_count.bits.SINK_COUNT)
> > { @@ -662,14 +658,15 @@ static bool detect_dp(
> >  				return true;
> >  			}
> >
> > -			if (link->dpcd_caps.dongle_type !=
> > DISPLAY_DONGLE_DP_HDMI_CONVERTER)
> > +			if (link->dpcd_caps.dongle_type !=
> > +			    DISPLAY_DONGLE_DP_HDMI_CONVERTER)
> >  				*converter_disable_audio = true;
> >  		}
> >  	} else {
> >  		/* DP passive dongles */
> >  		sink_caps->signal = dp_passive_dongle_detection(link->ddc,
> > -				sink_caps,
> > -				audio_support);
> > +								sink_caps,
> > +
> > 	audio_support);
> >  	}
> >
> >  	return true;
> > --
> > 2.25.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
