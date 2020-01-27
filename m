Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9467E14B0F1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45B06ED17;
	Tue, 28 Jan 2020 08:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5156EAAB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 09:53:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwk4V4k0QnwfP24QhoAkPppRKha/XM8rWFt/qqjr2avYWaBQCWjK5jwSG1ENbfFdkGRSju+FXV2FcNJJUL+kqT5ycaaB4JdpVBIxYhqZwnW4f2UwV4bB/LDvYEYQH92041DwlL306f71yNfLNV0Ww/TYB6v6kvc5icrNBIGg0uu3Ag45LiUc04vHyLGB4R7kEspAiarZ4gGmerkfbD6S5CLW+OUo2hsioeQbl7c0rB5ExXY3675cwBrJfGlg7srJW/YSYdEZpyf6MYP6vMz9hBQYbilG/po9KcFdWpWTrFp4cm2qVCxv4dT+BVFthnHkvrXsZ/KURat3f+6evR2BQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMaM88l1fKCgcP4KVh6PjyYClz8fp+jtBabRhkdUgKU=;
 b=VvWupL8BzsjdgsAM4TnUCYAhFUdhDQ5Tfd4/gJnVPL9GME6J30LehOakz0iXhL+OoC82eo4Ln0K+GtHK/FqUT9Gl1AOKIIfP+QnMjBGNOqiFv3Zllng3iKx7c+InTxuU5pXJ7bNTqxh1h7KS5CNgehM8XofsrtTux8aLI9jHdrhVMwxlnfaBsSvWLB9hKZ70yYPXk/JxmFoEGYzUEqcEBziH4Ec4FEardOVlRrWTkY+oVrDFyUHNgnDwO0cYttq16ad/MfsiqWqDEY0sA3JCQYCb53dqodIc7DmyILfHH8yhsDDHl5wfVnlWhJHacRu6VnnOu7HzckbHPSRYGBEVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMaM88l1fKCgcP4KVh6PjyYClz8fp+jtBabRhkdUgKU=;
 b=J3mUbHO6RNgi0IgdkRJswGqwGDfbtv71rZvvnQaXGnfPlWnZRWj/YXckugSL497YaT3+BRq6jpgVzPMMWU7lo7gBEAkiClVZ5L7WfjJpfq/5XKG+miVVvM2uhSWvl0lZaU79YjojwUPFQrVmC9LnlIiJxQvqZv0niuqOg2DRrWU=
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com (20.177.41.82) by
 AM0PR03MB3827.eurprd03.prod.outlook.com (52.135.147.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.23; Mon, 27 Jan 2020 09:53:43 +0000
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59]) by AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59%4]) with mapi id 15.20.2665.017; Mon, 27 Jan 2020
 09:53:43 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "david@lechnology.com" <david@lechnology.com>, "noralf@tronnes.org"
 <noralf@tronnes.org>, "sean@poorly.run" <sean@poorly.run>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "laurent.pinchart@ideasonboard.com"
 <laurent.pinchart@ideasonboard.com>, "emil.velikov@collabora.com"
 <emil.velikov@collabora.com>
Subject: Re: [PATCH v4 15/15] drm/xen: Explicitly disable automatic sending of
 vblank event
Thread-Topic: [PATCH v4 15/15] drm/xen: Explicitly disable automatic sending
 of vblank event
Thread-Index: AQHV0c6CEXRqkijnAkKuyerYilRMX6f+S7MA
Date: Mon, 27 Jan 2020 09:53:43 +0000
Message-ID: <74d7bb19-642f-49da-8198-56ea0c0d1a4a@epam.com>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-16-tzimmermann@suse.de>
In-Reply-To: <20200123092123.28368-16-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e148bfd0-b20c-4eee-bc94-08d7a30ecb4a
x-ms-traffictypediagnostic: AM0PR03MB3827:
x-microsoft-antispam-prvs: <AM0PR03MB3827160464941549062B9804E70B0@AM0PR03MB3827.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(199004)(189003)(54906003)(316002)(110136005)(4326008)(478600001)(31686004)(2906002)(76116006)(81156014)(81166006)(36756003)(55236004)(8676002)(66556008)(66946007)(5660300002)(8936002)(6486002)(6512007)(7416002)(66476007)(91956017)(64756008)(66446008)(53546011)(2616005)(31696002)(71200400001)(26005)(86362001)(6506007)(186003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3827;
 H:AM0PR03MB4516.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BXB09I8fu/Pc5fZk7AUPTERGzJoMZI04wXyOl4fLQX6qDU+FpokgAs8N7FSDfx3BFSvTHsXUCGg95p3WkuiS9eg6cF14DrZRuZ7YOTx9x+fMPFyuulFaxPMpflOjufhXrlj/kLu0yTcTaqeehvAb96xjF0OAi+2NzA5CQ5qpV+0QjDrbvnsydahMC36nseVqIhkUE4DOez+5fx+Go1MQ7vy8uOeFyjobnP8h7KcXNFLPZOyAGszy3T76Ob7qCideTP6d0pNXuJGaH1d1CfoCwkaVjZQx3Hzz/q073xCnu9750GCggdJsk6FwjlmA73QHpzxBBd6wRfzjqhOrl8kIVOSjMpyrZro48nY42XvUZUSbWluNrEeN76kH+nloEXRPLVN7oJeslMWZSc/dI8hyQYd9b/tC1OHk6xgPEYu/PrRN3ohbEhEC8yt8Bq9OdPpx39wKmoZvWdX8dGRujjApgyPtjmkm9/YD7q6JtndN4+yluMSazKU01gB7HLwe1fVm
x-ms-exchange-antispam-messagedata: obn98Z8N/EamtIxcCU1ypn52g4CvCYWjWc8mN7BI7D3t4P+kDIhbDlA1Jy/vB4oEqccQ4b0wFjKN6N2bWM6/ghOKg1tUmRjHLLBab1VCIY8by2Zt4tJWqi8ZrsJlPs1B2balHIHUR75qi7+2SMKVEQ==
x-ms-exchange-transport-forked: True
Content-ID: <84886D4E7E176148849DECB160B2BB3C@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e148bfd0-b20c-4eee-bc94-08d7a30ecb4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 09:53:43.1117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7STOcv+PmjU2+iZZwuS5bCAQPlq7fliZw58vZJ468YfnoQ4RH1SFnNlZdEPQVdAGhyEKcIECUcK60z05Vg5eZozqig2hAasKxYxxuX8aYBt2I/W5fgvNHZ/zEXbHzXs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3827
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:36:33 +0000
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for jumping in late

On 1/23/20 11:21 AM, Thomas Zimmermann wrote:
> The atomic helpers automatically send out fake VBLANK events if no
> vblanking has been initialized. This would apply to xen, but xen has
> its own vblank logic. To avoid interfering with the atomic helpers,
> disable automatic vblank events explictly.
>
> v4:
> 	* separate commit from core vblank changes
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

> ---
>   drivers/gpu/drm/xen/xen_drm_front_kms.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> index 4f34c5208180..efde4561836f 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> @@ -220,6 +220,18 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
>   	return false;
>   }
>   
> +static int display_check(struct drm_simple_display_pipe *pipe,
> +			 struct drm_plane_state *plane_state,
> +			 struct drm_crtc_state *crtc_state)
> +{
> +	/* Make sure that DRM helpers don't send VBLANK events
Could you please put the comment on a separate line?
> +	 * automatically. Xen has it's own logic to do so.
> +	 */
> +	crtc_state->no_vblank = false;
And it is still confusing, e.g. comment says
"Make sure that DRM helpers don't send VBLANK"
and we set "no_vblank" flag to false...
> +
> +	return 0;
> +}
> +
>   static void display_update(struct drm_simple_display_pipe *pipe,
>   			   struct drm_plane_state *old_plane_state)
>   {
> @@ -284,6 +296,7 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
>   	.enable = display_enable,
>   	.disable = display_disable,
>   	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.check = display_check,
>   	.update = display_update,
>   };
>   
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
