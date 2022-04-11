Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DFC4FB3DF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 08:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD6610ED9F;
	Mon, 11 Apr 2022 06:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eus2azon11020020.outbound.protection.outlook.com [52.101.56.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A1610EDB3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nrb4qI9uwRzgtegtaxiawYy1Me8mCut+cUd5+B6Vkp6wBM0oA9pb0ZDt2S+LL90h2zPq+B72TWjDSvnLIQG6YOMJKOJm0uSqF5xoGEAX/37w46D19DzleaDJRTy90Mi2/ALirReS74vTjSuzhK6h5ok5xyQu68Q4N+MX1flZQMZ3Odk1HYUmqn8xrCxdoG8663vqWJa5N2j+Om1/ngRGJ1fyfe/PFYhIcd4tqIqzAeY/KhzHurjvgfoKf+siHs62jDDB2B9GYOo+d931oLP9pKo+MvPoh1BxOBtljeA2tmqrqg2ukb6UebP93Z19/sZfdoom2KkkEQTJK8wgPHFahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH4oHcxRJdJHpbppWsTRs9wmCMdIECt3ewX/LAAEdYw=;
 b=iF2quqWQTcfuEegrjhGR1shU8/iIRL+qsj+7wVOkv6Xo9wX7TTtfMklUQa28l+QEsu/d7reZBb8FotgIL34EZwedW+WidZWt6TuVIIIl2WIPUXB5r14HZck8twPnFkx1Q+KHdx3OdxZTmk/dO8pwrPKtdBPQol23v1B8Kqz3HpAciIITEzTqli3ch/+M+yxK3sZ7motm1xmdxv1I5W8Qx7aHF6yKh3ycvMWR7Mfs2J5M1ZEmbI+yV0SueU2T0E406QwqGV7bCtzqtpkI8dTTbs7gjRuX6xAprhuoeoIQ6v8n3QgJDdoWaN4FgqQWIdCMes8R8y+jOjavhgNTdyA+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH4oHcxRJdJHpbppWsTRs9wmCMdIECt3ewX/LAAEdYw=;
 b=Qo7JZuLthLNP6rLTwfmM7mXu0A8xMw4nkZfOOGh1pNpIouHyT6LnYXkNlhsEfjsqs5sLC4oS2cLfaps/rrvYxONj+svotBpdCdNDLAZPmDszElYda82GX98Etf3Z0fl5vnma7WHcviMlOyWyIK51SC7ir5aDXjNCIPoQ9/5/0Mg=
Received: from BYAPR21MB1270.namprd21.prod.outlook.com (2603:10b6:a03:105::15)
 by DM6PR21MB1628.namprd21.prod.outlook.com (2603:10b6:5:bf::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.6; Mon, 11 Apr
 2022 06:40:38 +0000
Received: from BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::1d4b:59e8:358e:2f1e]) by BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::1d4b:59e8:358e:2f1e%6]) with mapi id 15.20.5164.004; Mon, 11 Apr 2022
 06:40:38 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>, Saurabh Singh Sengar
 <ssengar@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Michael
 Kelley (LINUX)" <mikelley@microsoft.com>
Subject: RE: [PATCH v3] drm/hyperv: Added error message for fb size greater
 than allocated
Thread-Topic: [PATCH v3] drm/hyperv: Added error message for fb size greater
 than allocated
Thread-Index: AQHYTVqUmZIZ7yC1LEK4k8i5OfXuVazqPxYQ
Date: Mon, 11 Apr 2022 06:40:38 +0000
Message-ID: <BYAPR21MB1270B3CFBE674EB0A7537180BFEA9@BYAPR21MB1270.namprd21.prod.outlook.com>
References: <1649650437-17977-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1649650437-17977-1-git-send-email-ssengar@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=cbf33e7a-a815-420c-9985-6e6dea994b5f;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-04-11T06:25:11Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90bd4b60-14c1-48f3-9e1b-08da1b8630f1
x-ms-traffictypediagnostic: DM6PR21MB1628:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <DM6PR21MB1628C7A9A3943A1EB6AE07C1BFEA9@DM6PR21MB1628.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t59qEs4Y97gTKMzfIRO6j+3VtdnmAudoARWM4fP/nXQJB97vyn7dMLdjoHT00qls0VoY0kSWQWj1P4p8GeWvpLby+YKAN4OaA96Qp09XI6YdiqD6Il2USeM9ff/+TV43dyibi1n32yPbMKjva9KcuMIJfqLEAy4hB1oaLBQii8IPYMAnR3FxcWPujFDWd/3UzDgDiIN9yzN5O5MSNjqFTXAgt/+iTk0BNWHrD3FOaa5MVQ0Pt+07xwBfNTGXw4WgIXlsBAJu89LgcJy1JX9bV5y+tCclNmq+nc9t8UFBc7pk1zfM0HcO9OA/yKdOy7hUrd23RjFzO1zrHZBVEyPxuBiua+1BRYnIpNlak0/6+QBPtzdxI6ZFqvROVnOC2CjBA/mgw5/jZLNiwAHLvUcy9hWpUKi3t4O4FdNKjfxn16i9u4NWWiX7ZilSHuTMN/k6xTcUCHqUCywSC4PogPUsrfIyTn1Yew01dH7bawTk7GkdV6NwpSkRiyTPVplsRTwk80BSNJ4UjHHoylC/KVwvRSXr3borVQ6/QPVD2nSwg3kWY9M1SCQjr0fF7ltCpZn52xXqLozsRZH9oW1vqbirsJiM52+Vo8jnBX1Br9pISP/VP2DIFtOBn7zLQXbmDmNhWb8izfzPb05Ph1h25dofYeFK5IQcdO9oADqelSnBVaqqoJq7U9pXnJL5b9YXtbS+gSjf9MG1598X0dXA7ekblUStua9p+jXAzTLsMrwT02hkK5ohnsftSv70bHiE2jfs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1270.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(6506007)(7696005)(9686003)(110136005)(15650500001)(71200400001)(6636002)(508600001)(316002)(82950400001)(38100700002)(82960400001)(86362001)(38070700005)(122000001)(55016003)(2906002)(33656002)(10290500003)(66556008)(66446008)(66476007)(64756008)(66946007)(76116006)(8676002)(8990500004)(8936002)(52536014)(26005)(186003)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fJx3UxRkHVqeOIfls6uMQ3M8/Me7qnQwwWN1ezao3RyomyHEaCMv4M/cZiVy?=
 =?us-ascii?Q?618oH6vk2+IMaSDbRckFhpjww5hJkS4BIbi6sNrOcD815c7bv6DG4DKDfyup?=
 =?us-ascii?Q?1Xknp0rlzlJ+tECYcGMMAOSnjjhze3IBt/PPyijnZETttV9dxhhgfZ5oM0k9?=
 =?us-ascii?Q?7N4klo6bfmX+Rq6oYs25hDD9XGxighLtS9BImH9aEFMG0SiPJOWcI92eeYJS?=
 =?us-ascii?Q?qnKTLlRC321YiVyBRAAXbNBUKbAMb3DEKkNttx9nKzuxdKKL6CTzmqZlGmu+?=
 =?us-ascii?Q?Ywkuqti1Q4nQCaMaJzHytI9JrxzrxgoBhkJuymXW/wgos4Aw4i+slwQzuxDB?=
 =?us-ascii?Q?Qh2iFz9BlYErcDNXTNuQqLtdjQxu+lwKXK3IjepdLDnf5QEkf4hgvmGWMZa8?=
 =?us-ascii?Q?G5fpOK9FN9/j1Da3EAVdps1aM0+FD+Yf8CqRytHVKH2UAzUsOJLDmr0RjRL8?=
 =?us-ascii?Q?q/Z57FNu6ZjDNukjENkGy0dQhFekcMAqZvHCcl2eDvKaXxNj7awXFXBzXvJL?=
 =?us-ascii?Q?Ks3NHlJp0Ij83NKvKOi9BiBLHpsYS+foU5WtcQNBpFIAUN6bL8opfn7OKUAV?=
 =?us-ascii?Q?2PCc50phl/XSbKc2btfOZZNjsy0SABx3OtNVqT41m34Qk78PuYKmae5DyOrB?=
 =?us-ascii?Q?WVOF3ix6hGGkwPE0AYYSqHJq3BVk7PUIUGHsPLDVIxIH1WhNDFc/665Lp5pW?=
 =?us-ascii?Q?7Z/cuoqhmNRsp3Dia3NOuuGgj6AEuiK65D0khWRNVmDImtjU58zDJjMkT+P6?=
 =?us-ascii?Q?+Dh1+R2qe3iJTJ3pxI5z9lvzkedi48IAB0VY4/4bJbvWN0T02UNc58oIeUtG?=
 =?us-ascii?Q?jz40Bd1JMFczLYuruWKe5W34pbT42R1e34/fzWt02Ud23Ro3gxZnSm3aRH9+?=
 =?us-ascii?Q?Tc1ZlQJ/9IKZ2JO5FBsig3fn2ISjsrwfWn3aZUmkR3D1mOKxw+sRO+Apr50J?=
 =?us-ascii?Q?vo655ckontaT8f4g7oAukt6i5nwEk66UkPYGfrlnaWHTMlOFC4kfof84j0fJ?=
 =?us-ascii?Q?MkSGWpNXWogBnqHTNjrSoIqinBuVksBEHLMG8YTBsZY1+KpCdcICaEUu+V/d?=
 =?us-ascii?Q?syVK7cxz0PsVeNT0fbHKNzAPF3mHzRIHJ1LfOVIb010X2EGc9qyEIBu0yoKd?=
 =?us-ascii?Q?neuz5Z3a6eQhP347aKKzxAjlfCsVgyG9hzw621dQ+TdrBEdEoKseJNGibire?=
 =?us-ascii?Q?6fiW+RGk36fJmM4Pjipock5z524MaWzf3uTLvrScg1xoBil+u88/okiEMchE?=
 =?us-ascii?Q?77hY7JA25MoAjQ2ySakXjFz8ACut5mYc9mQrVERNmZnnyowWhtjc6w+ZA/5u?=
 =?us-ascii?Q?yNa1RO4PlMtvIW3T0bnx1sMfQq3c4//IuzWYE2fW/SjjveY279Snt0Ott31B?=
 =?us-ascii?Q?tOasMLGFpNQ+E4FhK8qC9Btaw9Bpdwfa3d1enZ6hHlb1wQ5WwI5jWeV+WhUF?=
 =?us-ascii?Q?2ppKH7Vtm9etYez7bOz7yFIH4hg+jZV5iSCkaujXgyke91zQfzYs89+BvRZd?=
 =?us-ascii?Q?+ntdQ7WPgYti+11L135BX7JeH5mXfCquCdNab+cy7Km/wFguUtjyRS+E4uy8?=
 =?us-ascii?Q?9YumSp4rNUMz5FMSs8UbLdEXIZRYDHGTk/CitOnj9lTNaI7Wlazxe+7yZhhu?=
 =?us-ascii?Q?6OQkXU9wfVTWE94MtX7tv22P6ng7aw2nvK7FisN2QdGfJ5MiLbFrK5nXY9MM?=
 =?us-ascii?Q?14Fkvvh1UXj7U/PvSK4/S9IMoz4OZk4+V4cGvvKmgR/nO7AodBd+piF3qrte?=
 =?us-ascii?Q?I7GM2qyvnQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1270.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90bd4b60-14c1-48f3-9e1b-08da1b8630f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 06:40:38.6205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQfeaKvt/ySK34g6kw7PRJEGVCnlOS6uZQVtr83Ls2xCzTcAhOwDK8XIpPwUfF17LWnPp3JoroGqjlmzf1gAwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1628
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: [PATCH v3] drm/hyperv: Added error message for fb size greater t=
han
> allocated
>=20
> Added error message when the size of requested framebuffer is more than
> the allocated size by vmbus mmio region for framebuffer

"Added" --> "Add"? My impression is that we don't use past tense in the=20
Subject and the commit message. See
"git log drivers/gpu/drm/hyperv/hyperv_drm_modeset.c".
=20
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -123,8 +123,11 @@ static int hyperv_pipe_check(struct
> drm_simple_display_pipe *pipe,
>  	if (fb->format->format !=3D DRM_FORMAT_XRGB8888)
>  		return -EINVAL;
>=20
> -	if (fb->pitches[0] * fb->height > hv->fb_size)
> +	if (fb->pitches[0] * fb->height > hv->fb_size) {
> +		drm_err(&hv->dev, "hv->hdev, fb size requested by process %s
> for %d X %d (pitch %d) is greater than allocated size %ld\n",
Should we use drm_err_ratelimited() instead of drm_err()?

The line exceeds 80 chars.

> +		current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size);
>  		return -EINVAL;
> +	}

Maybe we can use the below:
	drm_err_ratelimited(&hv->dev, "%s: requested %dX%d (pitch %d) "
                     "exceeds fb_size %ld\n",
                     current->comm, fb->width, fb->height,
                     fb->pitches[0], hv->fb_size);

Note: the first chars of last 3 lines should align with the "&" in the
same column. Please run "scripts/checkpatch.pl" against the patch.
