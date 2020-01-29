Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D314CB0F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 14:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE346F53A;
	Wed, 29 Jan 2020 13:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08A48951B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 13:00:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyWWywBs0ig2dBSi5fy9dueG1l8rMZBvbERSsS5bTm/yhCyivpkQejgYHAWJJ5XuMviJGCqrIQxUarrnCxw9CRFM5OL3Ea0Uvgv/HppIpmRSi7Yr9UjDXFnriGyOtb07MHFd1HEVGK02Ap/tV3GvD1NIG/eVlfJX+LUkQLbfYkvgr9GrTZgn0UH9M06BI4qj3MVK9e+8Ujcc25cOqvXukn+ZNHMqQrXWTA9hA2m7fWlkp3WBOfr88ZiHsB5fptNifn5Z16SicrYtnmcojIc61IMU6SISnfjkdFnhNOh8z5fZ/B+61mVKXomD3ZD4NUo5lgsAooxNndDZUxtLm47Ddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHkyC1wmgfxemgXldj4WTeEuIRR8aRVGSYLEAO5rRto=;
 b=f1QMuFF7eHxSiZs6XbwWzK1SMG9Tr4sVzNLO+yFNqr6icPuVdm9QpV+pZcCktM9YuguKA5AIfEhGfvHP6aYkAlq58TqJ2TpAyPQYqFsRRnGHN8YaEXbwlmTOAUKYn5qxbKwf0egpjdTDd2sBBpWX93tVE+CLdNK1pn519WGGk5a68G14lp/52uCBArD2C/p+qWPhhjZyJdXzqq/PFwzoN+vqEfEKDjnRQ59fOGtUxQHU3tTK2gOM0maxMxcojbSkLbRY2z+fDAK/bsKXrgr3Lt7FsHWXyIWfLBiu+dYM77e46OJuOkAT//dKBtZ8EG4deXZaM++4h7Z4qLBRquXsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHkyC1wmgfxemgXldj4WTeEuIRR8aRVGSYLEAO5rRto=;
 b=ZaZj8is3BVl091tM7iIRzA9perB1mQo/Snnmm1f2Tke18Ip2+oD6SZhyKwzJssGN0fuoJ7omaKD7svSGBqr9UrXRL2AEXXqetzpYcCHXLQBklBEfa3ZZattdS9W0jeixM64yUhow0WBs7Lg9uOvcT3+SuHxiUWXsj8VAxGXoamw=
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com (20.177.41.82) by
 AM0PR03MB6163.eurprd03.prod.outlook.com (10.186.172.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Wed, 29 Jan 2020 13:00:37 +0000
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59]) by AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59%4]) with mapi id 15.20.2665.026; Wed, 29 Jan 2020
 13:00:37 +0000
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
Subject: Re: [PATCH v5 15/15] drm/xen: Explicitly disable automatic sending of
 vblank event
Thread-Topic: [PATCH v5 15/15] drm/xen: Explicitly disable automatic sending
 of vblank event
Thread-Index: AQHV1pxwF+EM045xT06g2ezCLcsR3KgBmvkA
Date: Wed, 29 Jan 2020 13:00:37 +0000
Message-ID: <e2bd0ad6-573b-17e0-c47e-6550947b1916@epam.com>
References: <20200129120531.6891-1-tzimmermann@suse.de>
 <20200129120531.6891-16-tzimmermann@suse.de>
In-Reply-To: <20200129120531.6891-16-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0b5f671-a53e-46bf-82c4-08d7a4bb3c3a
x-ms-traffictypediagnostic: AM0PR03MB6163:
x-microsoft-antispam-prvs: <AM0PR03MB616389306962D42A4277E520E7050@AM0PR03MB6163.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02973C87BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(186003)(81156014)(478600001)(26005)(8936002)(55236004)(31696002)(86362001)(53546011)(81166006)(7416002)(4326008)(71200400001)(6506007)(5660300002)(8676002)(64756008)(110136005)(91956017)(54906003)(66946007)(6486002)(66446008)(66556008)(66476007)(31686004)(76116006)(6512007)(2906002)(36756003)(316002)(2616005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6163;
 H:AM0PR03MB4516.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ffiV1zogbA1tH2bnYsQBFD9OgbMv7WJ/r+OGwzr9cir6CR6dCYOBVG5zHQcaY/ddasghdDkCOCFWyrV/46TfYIbhM1NiAqvMeAJGDKQU54wiNoSMzkL80hEnuWyizNVatxDRVTr1eF+tLrxntppKMy76sSwe9/jTlQJoSUjaE+rPrPLrMxoszuE3Geh8yPP00BlyJQQyiHVo9LZnSuqeT/SJT+YSoEFpoegFDpXMdmjfyS4+LO9q/VDyP8dlIygJUns/smL8R8W9ABnKCfn2kQRNqkgok+R/DGdptQFGKdn47B51G6SmBBLD/N1mI1X1dpJ5aE8nKRXBNCWsDpGdpkfWGxXqzYAt/MCrIPwCiTFjjnImxxo1lYx40Yt9/osP21vQbsMpMrcRs8pqxht0oNWvDdpLJamXWF87EKWJEYPbnr1hICzho94Jbzy9VsewrTR8m3A9r8zGNbJ+a1dYzCRbI+M/aySsjYE2nDeyqVCJugSqzSKw4HF5TfVfTu/b
x-ms-exchange-antispam-messagedata: gMxyIuVgBj9FGERNx+h5hYpMcG4aKBz8pADYWsbJzkAlBsD2NCq71L/L5ea0OmUOmThxOF2beekawdNLev6/+K2luK6vOJ1Y6Ptht1gaVIvwcUladNMAbpw+jaQUEA4siyo+8Z4uFA7FkrNZApPcDQ==
x-ms-exchange-transport-forked: True
Content-ID: <4519BC3C3687C54C8173137068C5FDB3@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b5f671-a53e-46bf-82c4-08d7a4bb3c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2020 13:00:37.1312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ID9HZ4dzAOB9DgD/qT1LhHNMjP3VxuKeGKuL6Q63ZoCWaTm2EUoETTPmU9/rUBX+rHzTzwfdLrMBOHd4d2EH+sMEBPU6ifDYQz4XS5avHF1lxnKZlkgRPn73PdEEQio
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6163
X-Mailman-Approved-At: Wed, 29 Jan 2020 13:03:26 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/29/20 2:05 PM, Thomas Zimmermann wrote:
> The atomic helpers automatically send out fake VBLANK events if no
> vblanking has been initialized. This would apply to xen, but xen has
> its own vblank logic. To avoid interfering with the atomic helpers,
> disable automatic vblank events explicitly.
>
> v5:
> 	* update comment
> v4:
> 	* separate commit from core vblank changes
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Thank you for your work,
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   drivers/gpu/drm/xen/xen_drm_front_kms.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> index 4f34c5208180..78096bbcd226 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> @@ -220,6 +220,24 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
>   	return false;
>   }
>   
> +static int display_check(struct drm_simple_display_pipe *pipe,
> +			 struct drm_plane_state *plane_state,
> +			 struct drm_crtc_state *crtc_state)
> +{
> +	/*
> +	 * Xen doesn't initialize vblanking via drm_vblank_init(), so
> +	 * DRM helpers assume that it doesn't handle vblanking and start
> +	 * sending out fake VBLANK events automatically.
> +	 *
> +	 * As xen contains it's own logic for sending out VBLANK events
> +	 * in send_pending_event(), disable no_vblank (i.e., the xen
> +	 * driver has vblanking support).
> +	 */
> +	crtc_state->no_vblank = false;
> +
> +	return 0;
> +}
> +
>   static void display_update(struct drm_simple_display_pipe *pipe,
>   			   struct drm_plane_state *old_plane_state)
>   {
> @@ -284,6 +302,7 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
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
