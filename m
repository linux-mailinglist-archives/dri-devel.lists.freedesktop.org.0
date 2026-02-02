Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKCsA6G7gGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:58:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3ACDBEB
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6615C10E4ED;
	Mon,  2 Feb 2026 14:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UGnMOc2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE9610E4ED
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 14:58:36 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2b71e7dab12so231691eec.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 06:58:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770044315; cv=none;
 d=google.com; s=arc-20240605;
 b=Vk+An9PYbsVkEasqjv3bSdioiRTPlPma5b+fSij8aHaI7MxrRybPoO46eUlVFtHW8G
 lVbKQ+b9K9aWjp6oxludLdvVPJcxHdHXofFBBGtzTJxu9gVo3bzazj0kka/USs2YzWWG
 zcsopuYmX0rQvgfy4n0/9jYYwE8VoLb2OVhRicMzA5evOb2mndN93oaTuNxptBvp6Vw7
 dAAtP8SK7a+v6pH4u0Kb7HgwLfUjqhDvdzuOa20//1xuIMLz4ymFrFupmXesxpdsKKji
 K9QPk7NrM7SkwC1EXEreFh9CQV9Eks0epXB5Isizd2hKo5bFaibns7AeTdv0k7sGbB0I
 HJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Y8+k+DGcAe1gDTlJAG9djuDxYhynbUvFBC9pBD/2cLU=;
 fh=N9QGpiUPGPMmWR3BV0WqyIJsuPP5hHIs3aUD0qGzlRY=;
 b=D6XoqsrOo1/ieNesu+6rsyTExjXmquBSberedOs/qs9phI9OiqkVqWQaEiURkpCQTa
 RGHBKH2G63Bpwue2IWTwSdT9Yf8ToO3uTBGlLhCwXiThokeJZ/CVBvOUs0FDjPbJev9z
 CzneO64L0owEkllahroZoSkl345PQFC6KEpejdj++8+pt8NchmGa5RsRGrdP5VEaiEvV
 pGCuV9bkNYDg3HcFnUCrEaYcNhT4RgUhdAT+2FHnWwbpdt+JRmGFVj2HpEJ8SRwCITAE
 /j4YUH4XoZQ0X8cBWASJdzOvZ52yKHMsdWAWhfzMFdTB568haFRtti9K5LtWwbSKLL0c
 zdpw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770044315; x=1770649115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8+k+DGcAe1gDTlJAG9djuDxYhynbUvFBC9pBD/2cLU=;
 b=UGnMOc2O+AIxkFJ047jSwAIhSAKtp3x0r4tpr9cOAWKZT2XrjXYkr28UyF1WB12cKf
 pLfPmUBPHpLMwrz2JD5417yDlY+pU0sOvpX18QmKC8CEuiOSrT6/XPb7vd2Z7hiO76jn
 IUkEyfufZ4H4nKS0t/oFl8e9NrYE37MBUh3gJNLjukpT9g/hLfNqNhl4LR34Y1F6m+X3
 KSvP/EDbFqybfzfeAwlcvlQXHcBeb+Sz5hHePpan3I6JcDpHKZ0P8Jit3bnuR0NCkMJW
 CL+rVxQIqG8bAXjx1yMxhN6lmip5mIDVISohpdlcAfKF4uw+gTUYsyNdvZgluSsQhrBb
 Ag8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770044315; x=1770649115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y8+k+DGcAe1gDTlJAG9djuDxYhynbUvFBC9pBD/2cLU=;
 b=qsXOoZHgN9xJUze8tyc6vzhuJEao8Kyb965L4eSdEanQ3SmzRCLzQw0/0X2pzsXsAc
 zFwN/ApypAwmxkOQ4xDdKfDbD1s9EKAP/kPZgi0/BHHi3hiISlo4pdwwLJR8yo3gMql4
 LYalbyvwiwp2tTfic6mQqbOr+Jfa+T56Kt8RF+dssCCT/bK3Vv6rVaPI6n5V/zvO9Bxk
 JS8dSdTA1dZ0fwS94JwAYRUMceO/K+pBqQDTvd6tDXWN5FthxKO/mp6c9m6ObCaDlWGk
 56XpbmwnfDYvc4VrA7E6dLSh4lhSuIRArhnmc4ONG/6LgnZd9gHpWTjGc0cEUhqwga6T
 KZag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMABu89IAgV4sG24s3xNxrtbOHKDyg49S85W0JP63b5oRTsZKG3vVlrbH9qaWzE/tf1FZNf84jPcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq1QILmc0bc5TF1cxrrE30/Kld8p22To8DtPF8JUjUgqbimmFG
 j30OvSD85V861f8FfV9NK9Ag5D1ELKOZHxHwj6lkqC+t4sjETRkeu4Sgwkv0ljYYpIsrHzzzXiL
 e9FlGiFjoIHNtNIhQ4GPydxT9/Eaev+Q18w==
X-Gm-Gg: AZuq6aIAVBJ8dorYhoowpUn6qAmZkLMO1YUUZpvyQY/fvmjjX2dbGMdZ91eHFK91FTd
 /GW9HXPcfqDUxLbBBIl/G4dJknvJRe6l5X2nb9ouUeZu/c8XNNmXINClE9c8Q2e7DennYAHA0D0
 foMB8MKDZG3yV7woRQYzID1mvTalT8FtHtK6gQ8jcwqViAe2YZ1KtDv4vjzy3tVW2fpDkYqCaD0
 gET10NS+qug2OEObKT4LTysdGo079PP1Hj9yzOlw4jp5gSQIAFlQoYTXcRl3fmwl4lntaks
X-Received: by 2002:a05:7022:6b82:b0:11e:3e9:3ea5 with SMTP id
 a92af1059eb24-125c100a594mr2795816c88.7.1770044315352; Mon, 02 Feb 2026
 06:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20260129083515.886112-1-zilin@seu.edu.cn>
 <PH7PR12MB8796F7F06A2F1DEC1FDAD683B09FA@PH7PR12MB8796.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB8796F7F06A2F1DEC1FDAD683B09FA@PH7PR12MB8796.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Feb 2026 09:58:23 -0500
X-Gm-Features: AZwV_QjdSskZltGpn-Lxc9ZyLeeFo3MJpk3n6GdqUfo_LpdyViGB3DrIoz_5Tm8
Message-ID: <CADnq5_Oc5bqtnjMyOgZOaSfK8uuNyZnY6MxYxCr6qo0he=cfZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_ras_init()
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Cc: Zilin Guan <zilin@seu.edu.cn>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, "Zhang, Hawking" <Hawking.Zhang@amd.com>, 
 "Chai, Thomas" <YiPeng.Chai@amd.com>, "Xie, Patrick" <Gangliang.Xie@amd.com>, 
 "Yang, Stanley" <Stanley.Yang@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "jianhao.xu@seu.edu.cn" <jianhao.xu@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Tao.Zhou1@amd.com,m:zilin@seu.edu.cn,m:Alexander.Deucher@amd.com,m:Christian.Koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:Hawking.Zhang@amd.com,m:YiPeng.Chai@amd.com,m:Gangliang.Xie@amd.com,m:Stanley.Yang@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[seu.edu.cn,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,seu.edu.cn:email,mail.gmail.com:mid,lists.freedesktop.org:email,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A8F3ACDBEB
X-Rspamd-Action: no action

Applied.  Thanks!

On Thu, Jan 29, 2026 at 10:37=E2=80=AFPM Zhou1, Tao <Tao.Zhou1@amd.com> wro=
te:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Thanks for the catch,
>
> Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
>
> > -----Original Message-----
> > From: Zilin Guan <zilin@seu.edu.cn>
> > Sent: Thursday, January 29, 2026 4:35 PM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>
> > Cc: Koenig, Christian <Christian.Koenig@amd.com>; airlied@gmail.com;
> > simona@ffwll.ch; Zhou1, Tao <Tao.Zhou1@amd.com>; Zhang, Hawking
> > <Hawking.Zhang@amd.com>; Chai, Thomas <YiPeng.Chai@amd.com>; Xie,
> > Patrick <Gangliang.Xie@amd.com>; Yang, Stanley <Stanley.Yang@amd.com>;
> > amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org; jianhao.xu@seu.edu.cn; Zilin Guan <zilin@seu.ed=
u.cn>
> > Subject: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_ras_init()
> >
> > When amdgpu_nbio_ras_sw_init() fails in amdgpu_ras_init(), the function=
 returns
> > directly without freeing the allocated con structure, leading to a memo=
ry leak.
> >
> > Fix this by jumping to the release_con label to properly clean up the a=
llocated
> > memory before returning the error code.
> >
> > Compile tested only. Issue found using a prototype static analysis tool=
 and code
> > review.
> >
> > Fixes: fdc94d3a8c88 ("drm/amdgpu: Rework pcie_bif ras sw_init")
> > Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > index 2a6cf7963dde..8de9f68f7bea 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > @@ -4343,7 +4343,7 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
> >        * to handle fatal error */
> >       r =3D amdgpu_nbio_ras_sw_init(adev);
> >       if (r)
> > -             return r;
> > +             goto release_con;
> >
> >       if (adev->nbio.ras &&
> >           adev->nbio.ras->init_ras_controller_interrupt) {
> > --
> > 2.34.1
>
