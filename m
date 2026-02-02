Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CQ0H/m5gGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:51:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C55CDA27
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1915810E410;
	Mon,  2 Feb 2026 14:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hq3RdXNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6820C10E4F6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 14:51:34 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2b6a868ad45so331158eec.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 06:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770043894; cv=none;
 d=google.com; s=arc-20240605;
 b=QHivSd+XYERW4w1eS/kr8Ripl6UGT5y7d8dQnNqwB2zrXpfaADoBjZDyoLcH8l1J1+
 aTWUOxWKhh5XSRWGZOnp3hdS/WmYpD67LG2Kz7nHvfDVMlMvPJ1Ej/5oDjj8HOsR8x0M
 QZ4r1KsTdj/ZuyvwnyT1r6Y4QSZxHZGnRQRoFtVW4gVjHzSSaHnwBUVouz5zoli0JQmz
 bOrthXx0QK6wQDcouaVa5KcdfQXXSzXe2pR8IlNdw/l5KfxTUribHYRQJj6zKyGRPQB7
 Yl06zS5zXOCrcc2u5yo1QFCL88v4T5Ybjv00rDInX9L6stFsQ7yzH7Mdn67Q9oq3OfPf
 jzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eAtojXyqiPHPaom00sJMJGGJnGovuCBOKmtfRykM3lU=;
 fh=jA97sym/pmkjaEjnUERKkJX/EBu+DD/mBlAagGMct0o=;
 b=hZq/9g1uLKeEt4niJn4HylDsKxIB1CtM3Xv5KJGIpKKqYwIMlbek1QT6ahZ+hbboaj
 bpGRGbANbvquemkWeST4kMciW5QiWNHN75h9ezT7xdAu+Kc6aVkvFWpqq4Plpf3Rvl1W
 L6ie4cnNd3iRTf2t9WQec53Wr62r2W2UuaosnFRKqLdDQuSLVLMtCE0mvucE2Hm00XGW
 6d/7rTb03Nl0skPK5UXYcd+jsCwSVWMC5UZKvHTZzJ399X9lnv7bTxJyNNiILcyMAX1i
 uU6mtt1QKuHj/2opoh2cCHkw97XjlLQj+bEYNaTCJVld6jvWtPTmlRPkJiXf1NsefzlG
 Mthg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770043894; x=1770648694; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAtojXyqiPHPaom00sJMJGGJnGovuCBOKmtfRykM3lU=;
 b=hq3RdXNStvdfcCEJlHzu9GDPCDnYfcV1oHmU2JJydZslXo0PyA9ca+m/LyBeu7QVYv
 iT+zJigiAL6ljQA4xIEVpx3xCRhKhCR+aYYqQcLAF9MUWNezMx3/IBqz5HpjHbQbMNYQ
 W1wcYh1xYtyh2f97iOyjr4Wo9Tgem/T7zEM2z3Rrm1Z8nowKzZ1v1fa7dyTUOdAXjH4V
 ikFbF8KqpCjeuj5rROD+7mgk19wuvjL4eft4mLsnJZiS4H2sgjredcvpuOUQAK+8c7AJ
 qzIzmeew8aONhIVfggwvJb5s1UYrWP5M71noSuOg8cVvxV6lk5X+0LN9/xAzYWwKDBiV
 pacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770043894; x=1770648694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eAtojXyqiPHPaom00sJMJGGJnGovuCBOKmtfRykM3lU=;
 b=cQIw0r8AzMlcUrwpc01Vka6Crp1Kx9LDyjWGV6M4LtbvIzFy6HagkicFeq+oDEFiII
 v/1mz7E09w52Jyfj3qoJqxlUBygg1+IAwraCnhqPh4kFwQuXTZJgQ46DPE3+CDj33gs6
 oBKiB2PiFgKn53RnocpAarT6oJoAQ3mwJ2Mf6pH5rXDBd+o7pWIdEet1YSY5EznsQOlk
 7rpTyO4cD3Mh110zFRRHUbhUsu5iV+xK51pd0ZJm9Ho7TvbHrRVdLE54cexV0/1+sfjG
 qotsB5tlDenPVz8lE6v+2I8sAcsIAhqguaMDOSBF0nmoPoqofDc0JCVy/HqIaYP4IieD
 2l8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGVeqhWk6eQ68b+X1V6S4cBlqNAb/7GpDbxrqVY1LTBBLOknsnLIfjTvF8SquWoLGAD02QovrMEQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7YzvS4ucC6fH7UbF5cGfYmAfNBjeK784a1cQ1E3UQav9RtUWc
 TKkHTfgYij0CjKYBod1doWztpfrQkfKHaDyTr+XBdKVtj7JCw8fCsVO/vbPxx4Xg+xeNhyPDhrv
 OSUEaB42xKVHpSN7ZN4aPVxwgo3pVHik=
X-Gm-Gg: AZuq6aLgdYIDVXBVJYtgKpXE+DsGCLrp4dpKAMNe8j2Wc0xZWQKX59S8zgff2xHuAoI
 PJKo73dGnP0A9a4WKGQOkttVtmi4tFvWPw87rbSyd3F5ochzyWG2hU19GAaN8w6bVW5skVHsatZ
 BU6lmLUktqUUDgynuLU1rh/9sLzr1JiPpumAeb2ok9Tz1lVOVCkOL9mZD9bPRIlOz771VcwB5II
 EAtP5vBT6eaaHsCTjtUwM51fhhvpa+w1t63R/hRslgexvE1lIcGS5DcgavKTvPAZ5+yXkdO
X-Received: by 2002:a05:7022:98b:b0:11e:3e9:3ea4 with SMTP id
 a92af1059eb24-125c0fff10bmr3041234c88.6.1770043893521; Mon, 02 Feb 2026
 06:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20260129092532.921809-1-zilin@seu.edu.cn>
 <4bfe8f26-3ead-4d6f-a85b-da83ad45d57e@amd.com>
In-Reply-To: <4bfe8f26-3ead-4d6f-a85b-da83ad45d57e@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Feb 2026 09:51:21 -0500
X-Gm-Features: AZwV_Qi4P_4OnZTKfh0lWk_Jqs4E6hVliJ1TLQzpcrAozEP1Ap4pVTKsEASA_bc
Message-ID: <CADnq5_MFq1h+PeGtMK=xgAHCBfa7MzYMhkTuh_YOXpEj4rgEpw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_acpi_enumerate_xcc()
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Zilin Guan <zilin@seu.edu.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, mario.limonciello@amd.com, 
 pratap.nirujogi@amd.com, alex.hung@amd.com, sakari.ailus@linux.intel.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 jianhao.xu@seu.edu.cn
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lijo.lazar@amd.com,m:zilin@seu.edu.cn,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:mario.limonciello@amd.com,m:pratap.nirujogi@amd.com,m:alex.hung@amd.com,m:sakari.ailus@linux.intel.com,m:amd-gfx@lists.freedesktop.org,m:jianhao.xu@seu.edu.cn,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[seu.edu.cn,amd.com,gmail.com,ffwll.ch,linux.intel.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,amd.com:email,seu.edu.cn:email]
X-Rspamd-Queue-Id: D4C55CDA27
X-Rspamd-Action: no action

Applied.  Thanks!

On Thu, Jan 29, 2026 at 5:15=E2=80=AFAM Lazar, Lijo <lijo.lazar@amd.com> wr=
ote:
>
>
>
> On 29-Jan-26 2:55 PM, Zilin Guan wrote:
> > In amdgpu_acpi_enumerate_xcc(), if amdgpu_acpi_dev_init() returns -ENOM=
EM,
> > the function returns directly without releasing the allocated xcc_info,
> > resulting in a memory leak.
> >
> > Fix this by ensuring that xcc_info is properly freed in the error paths=
.
> >
> > Compile tested only. Issue found using a prototype static analysis tool
> > and code review.
> >
> > Fixes: 4d5275ab0b18 ("drm/amdgpu: Add parsing of acpi xcc objects")
> > Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>
> Thanks,
> Lijo
>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_acpi.c
> > index d31460a9e958..7c9d8a6d0bfd 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > @@ -1135,8 +1135,10 @@ static int amdgpu_acpi_enumerate_xcc(void)
> >               if (!dev_info)
> >                       ret =3D amdgpu_acpi_dev_init(&dev_info, xcc_info,=
 sbdf);
> >
> > -             if (ret =3D=3D -ENOMEM)
> > +             if (ret =3D=3D -ENOMEM) {
> > +                     kfree(xcc_info);
> >                       return ret;
> > +             }
> >
> >               if (!dev_info) {
> >                       kfree(xcc_info);
>
