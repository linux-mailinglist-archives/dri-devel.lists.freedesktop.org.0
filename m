Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHkEN7y7gGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:59:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77ACDC18
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85BF10E4F4;
	Mon,  2 Feb 2026 14:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iZS4+0mz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6588810E4F4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 14:59:05 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2b78c97f57bso236896eec.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 06:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770044345; cv=none;
 d=google.com; s=arc-20240605;
 b=CYUteTk5mCU1o4Zl73WJvIubfrdWrWEaiy0mk1PS596zw0hpMSHffrybRfqJfaJl9B
 ZNLgHhsWCus/0zkDVp4FFUZyc41n62uPZ1ByuCn8xzoGWbgDnkiqHI+bNhr0d0W1dQhr
 mtH8Q0hpsdE3cAYoP07sEOGJE+mYQYT/wS20BsZCvCcZxS+HLK8+G1Upa6LWDo4zNih8
 GnbhZ8eTLQboV4JQMOrofKoIS3BnvoMRwa+I8RWc0uHTkVpkZE+QGAd23a5vxxHiOkc+
 +gqNSkwVd+1JViRntlfqvvalQTqwbRxeEMNwPNMeVVuuAV3tkyB4c4FTSxqjxsfeKoo5
 yWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gQRJkFAtvrDSoBzFZ5RqTeD1ft2EJueQQY8Q0SMaqVE=;
 fh=3h3jSYGc5L8g34xNvyydvIRHBTPjX1S8dRotLVNbj/Q=;
 b=DXqUO4y0nelp3gSbuTRddYaZNwVRnxyNsrBDxzuY/+QVXjM4P6P+qRz04nB6PYrKN4
 L1h11nMPgbxj9DiqkO61GcNXgTvY1dOdridzvNy+34MMBAQYHpXJF5R4GgAj0HgR7h1L
 5x4Fbv/uFIBFdLmSHTOrjmh0RsVH+z3AywPWhMCZ6/4an0pIA1Oi+GNl1pDJNoxqPg1r
 FRkL0VALUeS5Rsa4j4cdl4ub1yUwCrRf8sYP5JjNpxYkeQvLsTmdftCVJfQ8z3jSgZbU
 vJx2q2yw+7go3hIRl97S3+RoeL6Blq4L9YwJ8WNqrY9i/g/BGe3Hb0pqtgJK+NVFRqQM
 s7hg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770044345; x=1770649145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gQRJkFAtvrDSoBzFZ5RqTeD1ft2EJueQQY8Q0SMaqVE=;
 b=iZS4+0mz14OVpIjVjJcLdGouLHVHhmlQVHvxcEac+p3KiTxRBgn6KpGEgiKxcBgVGR
 r5beabjAJuSSDP0kqrX1Rdr48/lRMpsA3MjF7WNM6rqebTGCb8SvpCZDrrejeEmwUXx1
 tdJajOnJg50bgp2nvBNwCDmiPk93nJNZQ64qyKmHht9tt4El37O/uQHktxE1NGKz2W/5
 EZzSpysKgKxJ8BLTeyahNDnasOmZfT8kP4C7dRuxok1RETGnlBvT/WpzCuw16zcOkydY
 elL2zUSZwNMTxy5kh9uRKDW+C+4460HCDD/9TOVq0jbKHNWjfI8DlPvhAueF4TE36gn3
 rzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770044345; x=1770649145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gQRJkFAtvrDSoBzFZ5RqTeD1ft2EJueQQY8Q0SMaqVE=;
 b=HVSwd6gRkL/V9pfKn7tElRlfgjZsgjE2bgcYPMShJCGcQc3sgpulccf7u5IWXPMeV0
 nq78MQV4yXTWr2XVtm4cLcvp1qCMwtuQHC0GoS96CkwXXVOcGhYWt9qxDwm47Wk+Zud9
 QzMKyAo+f+rF+19Xitj7QrqchLDSEp+RsIOqgmlBPaQU+ZIuGjW9Jc5PKFaONj4NvRRZ
 6oh/7/YuyaS3oxDsIeh3JvHat8NLiCxSnFJkfLcrihb+hEnBSqc2nHb3YbbznahFMYOu
 i3fVgvNFfSnxFsAMQGXYfUe/xRx0CdMF/HGAmjIz5QaBEVi2iwRqlTHu3wShU6sbZxJG
 KYOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+f4OHWolTtrNQ+AAvYaLcr0tVWjhPqi16se2iluqUaqd65mzePh3SMmVtPOBP072PwF7c+Wyat/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymkzARU7SMP+HKSqtuWTot8/ebY+X0jdVYjDXOyD0Rl3J8QzJb
 lnD/WcL0bHsAsPCc1zRyay3Uih9AsVezu6KXJEjllkPnYWRsMp5Lr2O8qPnTFIpoE8cnfsGMd5O
 stCvt9zMBvq3j8kWnq1fbkVli+3NazDY=
X-Gm-Gg: AZuq6aLTiYI1FtYGeMS5z7y3BnIjgnuPnDBlO+j+LkePc8IFbHK2dT9MfLR+0CUT2fC
 wCWFFte+ukSDQJLzR35w089BfDZdGrwW70HoV3dIwKec/M6JpjzSM0w6LUBML0nG/J2kBN/hb2R
 IP1j2MdElBvKAT7jGnHoiSlTMcMJZDXcVxM1ExI+CY77HOlSauPZkw1H/gvds21NbGfFLS2lg7/
 2j1THIlQnW3GjmogAVatrFM8Y0WwT9juTU6uTpPcpGQIQawJOqAPQY+0niXaVgAklLheA34
X-Received: by 2002:a05:7022:41e:b0:11b:ad6a:6e39 with SMTP id
 a92af1059eb24-125c100d211mr2769154c88.5.1770044344589; Mon, 02 Feb 2026
 06:59:04 -0800 (PST)
MIME-Version: 1.0
References: <20260129090542.907623-1-zilin@seu.edu.cn>
 <031ae8a1-5608-4993-91c2-c5945bd6f7ad@amd.com>
 <b814cdb3-ce83-4db1-b512-c69cc54bda4c@amd.com>
In-Reply-To: <b814cdb3-ce83-4db1-b512-c69cc54bda4c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Feb 2026 09:58:53 -0500
X-Gm-Features: AZwV_QiDoDYhtJTuOfzTcyXV6ivTEimVGJC73YpNEbATJ1shi2vzRf7wsO4niUk
Message-ID: <CADnq5_N6cop1YXgFX14YJipLkWa+UoZJ6a6Q5o_aq3TZuuTwNw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Use kvfree instead of kfree in
 amdgpu_gmc_get_nps_memranges()
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Zilin Guan <zilin@seu.edu.cn>, alexander.deucher@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, Hawking.Zhang@amd.com, Prike.Liang@amd.com, le.ma@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
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
	FORGED_RECIPIENTS(0.00)[m:lijo.lazar@amd.com,m:christian.koenig@amd.com,m:zilin@seu.edu.cn,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:Hawking.Zhang@amd.com,m:Prike.Liang@amd.com,m:le.ma@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,seu.edu.cn,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,seu.edu.cn:email]
X-Rspamd-Queue-Id: 7D77ACDC18
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 5:12=E2=80=AFAM Lazar, Lijo <lijo.lazar@amd.com> wr=
ote:
>
>
>
> On 29-Jan-26 3:00 PM, Christian K=C3=B6nig wrote:
> > On 1/29/26 10:05, Zilin Guan wrote:
> >> amdgpu_discovery_get_nps_info() internally allocates memory for ranges
> >> using kvcalloc(), which may use vmalloc() for large allocation. Using
> >> kfree() to release vmalloc memory will lead to a memory corruption.
> >>
> >> Use kvfree() to safely handle both kmalloc and vmalloc allocations.
> >>
> >> Compile tested only. Issue found using a prototype static analysis too=
l
> >> and code review.
> >>
> >> Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table"=
)
> >> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> >
> > Good catch!
> >
> > But i think we rather need to question why amdgpu_discovery_get_nps_inf=
o() is using kvcalloc()? I have strong doubts that we need vmalloc() here.
> >
>
> Yes, vmalloc is enough. That change can be made separately or modified
> along with this.
>
> As for this as a standalone change -
>         Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Applied.  Thanks!

Alex

>
> Thanks,
> Lijo
>
>
> > Regards,
> > Christian.
> >
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_gmc.c
> >> index 7e623f91f2d7..cb0d1ac148e9 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> >> @@ -1382,7 +1382,7 @@ int amdgpu_gmc_get_nps_memranges(struct amdgpu_d=
evice *adev,
> >>      if (!*exp_ranges)
> >>              *exp_ranges =3D range_cnt;
> >>   err:
> >> -    kfree(ranges);
> >> +    kvfree(ranges);
> >>
> >>      return ret;
> >>   }
> >
>
