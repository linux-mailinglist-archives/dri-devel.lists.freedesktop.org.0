Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +r41OECbcmkFnAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 22:48:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370486DEEA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 22:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C6510EAEE;
	Thu, 22 Jan 2026 21:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="Qm3bc/2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8273110EAE4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 21:48:43 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b879d5c1526so297045666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 13:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769118522; cv=none;
 d=google.com; s=arc-20240605;
 b=W7/UJwVr5IfOIz5b9YDmywsa2RPF97hp4v2FvZ9H+ikvNwquFGy0LJr4YunYZF96W1
 0bmKBf6z4WOkz6luSOrzfCM55FQ7RSFAYACYO21e60qdVYgugzSi5uxDU1SuRt0PH/ia
 JkIaxOd8urk+y+TGzDrnkKFlWi6nWWRoeMOSoI6WxqZPRWTrCU21FPZ3alStVNIueaq0
 LMZIT+Akekywr8uktb8d1/q1ymnR7HfeTJvu4vlbE3LrBDNAGfUKLRXhuM04lP7Yg7qp
 pZ4aM3+koY0vcR/TghLE0HtXW3U68GHPV7UnMppSNpWJvVpy11NVkuJe9bQF3Pps+t+e
 OB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ne15GaPicXdJZl529f1ZvPcK/tvA3QDhIqLeZ0EIySk=;
 fh=2dmh0iBV1twiX1VeJvztNZLysdOQUdkMhIBX8wFUfjA=;
 b=TSNZw8QzKYQCVPv95J28zj2VM/aG0twcL6CygEUsxVrW8ZPHPxEIv8AS+fEynN0esJ
 60VTsZq4lnOH0BuNxsiVrhExvNIM4tR2HxI13tFXeFG53zRJmzIeN2JvCVGg6gdRHZLr
 /glJ54vhQ2paBJiyv1xxc92K31O+Ci2iDmyyF+NQC8fH2Xrq0H+pwDEeohfpATHKUnca
 nuGJ4joOZQ0pNPNzkwwnnqBkkJu1nFZnraWCO8ZEvf4H5Z6664A9kvcmkZnGbGRKsDjA
 Sqyi5NFYq6NzhtPbAI6of83uPFh5S791x8MfPhrXoibTOjnCJTkVhxjna9cKVhvGQCkL
 36lA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1769118522;
 x=1769723322; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ne15GaPicXdJZl529f1ZvPcK/tvA3QDhIqLeZ0EIySk=;
 b=Qm3bc/2V6Sy19W0ScRoA7D1jmmboYemSSSmVuztppjseoR3bvX4rMLToJLMvqJpKcr
 jHIhF+2hJ+vB1yMqO9xYRDxPAMKf/6Wd7TnZZk6jHl5WZNuiA8c/hB+SMKQ4MilleLkR
 dxe8vYlaGT4VtEtxiMpM/9BVE2eEY6q9X1F7D/ribBNkvDGnru9EP0qUjTF2Omp1096T
 WVQTxWAa3g6/5FE67ptifP3CQtBnvr7esMvNhEauYpx5bXVDffdE0pxcw0aajwNbqtAc
 6zoDJ62pYQLPwC/FH5fewoxCHge0oSYK4GaQeuyGZhKTojeDnfXI/MydLu4nbVIZa1MT
 5iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769118522; x=1769723322;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ne15GaPicXdJZl529f1ZvPcK/tvA3QDhIqLeZ0EIySk=;
 b=vhFM6C2VYJUzgVSyTFsP/sun+N0vY6KORjr7BepRYAp7g7xLgUZSQi1ageR2PJNfPh
 Kv4pz6oOfBr9KqU787BQEQl2jStmmFLTG/HaGdclwrLWuTS3zl3/r6WErnl+0FByqqfd
 J2oIhMt+PJ3V8yFIRJqeWmD60vA3CGJXW8c64b6jv60rB/+Of1flCswIbVpo2NtCCV2H
 aNRraqrkjm9QDjFuCBcJ5a+os1c1npU7w1/aQ6UXv/ph8BET9AbSp0i4kgjaGz1hgvpY
 LJumtbgTxosSJKo1H+830mKR+5qLAbNQPGZN78JoWaE0KVoAb/HdSsf1MUy9bRg0+u5Y
 ytdQ==
X-Gm-Message-State: AOJu0YzR1E+iYVz6YWaV/ZTDSzmPtvlGnahTin5zqo4DJoVLvMwILcvF
 VsLOPG/mdp8Xpu/EtiUmlmfvD2L4bG1iJspOERBUKVV10/OxgGypo86t59y9sVuxfXPg1mmM373
 u0fylFdrYbvHD3KyZB55f3YyjWcPly9Z7mZs6w4qQqQ==
X-Gm-Gg: AZuq6aLNj2ANDYmHVcFUoY4W0QUKyA5/0bREsQ6g4C9+f5vN/G+BS4NvQfVenyco3u0
 /LIocUsOga/gWUCxXNmlySheXsUdy5yHE7FnUe8js+0a7JBbWvM4OIA2K+dZydWbSRANY1hcCyw
 bZYQlG+l8Px0DGkXzJjQmYmZ6TlJi6FoWDz1XJqUUqLrF9RM0Dp6t3NvIUKZV+b7IJTdm36dclv
 I4Eh1ziX7rb6Hsy+TaepFj0fJhtRQsnAku+zOeU0EAZYT8pPzw9gvuTDb0+zw7LzYQpOt0s
X-Received: by 2002:a17:907:97c7:b0:b87:756b:cfb3 with SMTP id
 a640c23a62f3a-b885abe432emr41485866b.19.1769118521565; Thu, 22 Jan 2026
 13:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20260122202834.414058-1-airlied@gmail.com>
In-Reply-To: <20260122202834.414058-1-airlied@gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 22 Jan 2026 16:48:15 -0500
X-Gm-Features: AZwV_Qieo13qJt-pIVhWs1Q68RJ-Fe6d7pcBRtplXzLsbSjPwqOqca0WcxMkn_E
Message-ID: <CAAgWFh0WMK5Kj-nUDeRXnz-U2+wPY-zh3uw1yAi8==SekQsPmw@mail.gmail.com>
Subject: Re: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid.
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000000b32290649010186"
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[darkrefraction.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.553];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 370486DEEA
X-Rspamd-Action: no action

--0000000000000b32290649010186
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is meant to address the MMU faults reported in
https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610 ?

With this patch I still see faults when running the test script I posted
there.

On Thu, Jan 22, 2026 at 3:35=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:

> From: Dave Airlie <airlied@redhat.com>
>
> When NVK enabled large pages userspace tests were seeing fault
> reports at a valid address.
>
> There was a case where an address moving from 64k page to 4k pages
> could expose a race between unmapping the 4k page, mapping the 64k
> page and unref the 4k pages.
>
> Unref 4k pages would cause the dual-page table handling to always
> set the LPTE entry to SPARSE or INVALID, but if we'd mapped a valid
> LPTE in the meantime, it would get trashed. Keep track of when
> a valid LPTE has been referenced, and don't reset in that case.
>
> The SPTES field is fine at 31 limit, so just steal a bit from it.
>
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 33 ++++++++++++++-----
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |  3 +-
>  2 files changed, 27 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index f95c58b67633..73141dda4728 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -242,14 +242,17 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it,
> struct nvkm_vmm_pt *pgt,
>                 if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
>                         TRA(it, "LPTE %05x: U -> S %d PTEs", pteb, ptes);
>                         pair->func->sparse(vmm, pgt->pt[0], pteb, ptes);
> -               } else
> -               if (pair->func->invalid) {
> -                       /* If the MMU supports it, restore the LPTE to th=
e
> -                        * INVALID state to tell the MMU there is no poin=
t
> -                        * trying to fetch the corresponding SPTEs.
> -                        */
> -                       TRA(it, "LPTE %05x: U -> I %d PTEs", pteb, ptes);
> -                       pair->func->invalid(vmm, pgt->pt[0], pteb, ptes);
> +               } else if (!(pgt->pte[pteb] & NVKM_VMM_PTE_BIG_VALID)) {
> +                       if (pair->func->invalid) {
> +                               /* If the MMU supports it, restore the
> LPTE to the
> +                                * INVALID state to tell the MMU there is
> no point
> +                                * trying to fetch the corresponding SPTE=
s.
> +                                */
> +                               TRA(it, "LPTE %05x: U -> I %d PTEs", pteb=
,
> ptes);
> +                               pair->func->invalid(vmm, pgt->pt[0], pteb=
,
> ptes);
> +                       }
> +               } else {
> +                       TRA(it, "LPTE %05x: V %d PTEs", pteb, ptes);
>                 }
>         }
>  }
> @@ -280,6 +283,13 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool
> pfn, u32 ptei, u32 ptes)
>         if (desc->type =3D=3D SPT && (pgt->refs[0] || pgt->refs[1]))
>                 nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
>
> +       if (desc->type =3D=3D LPT && (pgt->refs[0] || pgt->refs[1])) {
> +               for (u32 lpti =3D ptei; ptes; lpti++) {
> +                       pgt->pte[lpti] &=3D ~NVKM_VMM_PTE_BIG_VALID;
> +                       ptes--;
> +               }
> +       }
> +
>         /* PT no longer needed? Destroy it. */
>         if (!pgt->refs[type]) {
>                 it->lvl++;
> @@ -374,6 +384,13 @@ nvkm_vmm_ref_ptes(struct nvkm_vmm_iter *it, bool pfn=
,
> u32 ptei, u32 ptes)
>         if (desc->type =3D=3D SPT)
>                 nvkm_vmm_ref_sptes(it, pgt, desc, ptei, ptes);
>
> +       if (desc->type =3D=3D LPT) {
> +               for (u32 lpti =3D ptei; ptes; lpti++) {
> +                       pgt->pte[lpti] |=3D NVKM_VMM_PTE_BIG_VALID;
> +                       ptes--;
> +               }
> +       }
> +
>         return true;
>  }
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> index 4586a425dbe4..1fe7915b8e87 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> @@ -46,7 +46,8 @@ struct nvkm_vmm_pt {
>          */
>  #define NVKM_VMM_PTE_SPARSE 0x80
>  #define NVKM_VMM_PTE_VALID  0x40
> -#define NVKM_VMM_PTE_SPTES  0x3f
> +#define NVKM_VMM_PTE_BIG_VALID 0x20
> +#define NVKM_VMM_PTE_SPTES  0x1f
>         u8 pte[];
>  };
>
> --
> 2.52.0
>
>

--0000000000000b32290649010186
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is meant to address the MMU faults reported in=
=C2=A0<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610">h=
ttps://gitlab.freedesktop.org/mesa/mesa/-/issues/14610</a> ?</div><div><br>=
</div><div>With this patch I still see faults when running the test script =
I posted there.</div></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 22, 2026 at 3:35=E2=
=80=AFPM Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com">airlied@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=3D"_=
blank">airlied@redhat.com</a>&gt;<br>
<br>
When NVK enabled large pages userspace tests were seeing fault<br>
reports at a valid address.<br>
<br>
There was a case where an address moving from 64k page to 4k pages<br>
could expose a race between unmapping the 4k page, mapping the 64k<br>
page and unref the 4k pages.<br>
<br>
Unref 4k pages would cause the dual-page table handling to always<br>
set the LPTE entry to SPARSE or INVALID, but if we&#39;d mapped a valid<br>
LPTE in the meantime, it would get trashed. Keep track of when<br>
a valid LPTE has been referenced, and don&#39;t reset in that case.<br>
<br>
The SPTES field is fine at 31 limit, so just steal a bit from it.<br>
<br>
Cc: <a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">stable@vger=
.kernel.org</a><br>
Link: <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mes=
a/-/issues/14610</a><br>
Signed-off-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=
=3D"_blank">airlied@redhat.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 33 ++++++++++++++----=
-<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |=C2=A0 3 +-<br>
=C2=A02 files changed, 27 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c<br>
index f95c58b67633..73141dda4728 100644<br>
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c<br>
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c<br>
@@ -242,14 +242,17 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct=
 nvkm_vmm_pt *pgt,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pgt-&gt;pte[pte=
b] &amp; NVKM_VMM_PTE_SPARSE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 TRA(it, &quot;LPTE %05x: U -&gt; S %d PTEs&quot;, pteb, ptes);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pair-&gt;func-&gt;sparse(vmm, pgt-&gt;pt[0], pteb, ptes);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pair-&gt;func-&=
gt;invalid) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* If the MMU supports it, restore the LPTE to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * INVALID state to tell the MMU there is no point<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * trying to fetch the corresponding SPTEs.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TRA(it, &quot;LPTE %05x: U -&gt; I %d PTEs&quot;, pteb, ptes);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pair-&gt;func-&gt;invalid(vmm, pgt-&gt;pt[0], pteb, ptes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!(pgt-&g=
t;pte[pteb] &amp; NVKM_VMM_PTE_BIG_VALID)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (pair-&gt;func-&gt;invalid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the MMU supports it, restore th=
e LPTE to the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * INVALID state to tell the MMU ther=
e is no point<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * trying to fetch the corresponding =
SPTEs.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRA(it, &quot;LPTE %05x: U -&gt; I %d=
 PTEs&quot;, pteb, ptes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pair-&gt;func-&gt;invalid(vmm, pgt-&g=
t;pt[0], pteb, ptes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TRA(it, &quot;LPTE %05x: V %d PTEs&quot;, pteb, ptes);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
@@ -280,6 +283,13 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn=
, u32 ptei, u32 ptes)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc-&gt;type =3D=3D SPT &amp;&amp; (pgt-&g=
t;refs[0] || pgt-&gt;refs[1]))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvkm_vmm_unref_spte=
s(it, pgt, desc, ptei, ptes);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc-&gt;type =3D=3D LPT &amp;&amp; (pgt-&g=
t;refs[0] || pgt-&gt;refs[1])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (u32 lpti =3D p=
tei; ptes; lpti++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pgt-&gt;pte[lpti] &amp;=3D ~NVKM_VMM_PTE_BIG_VALID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* PT no longer needed? Destroy it. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pgt-&gt;refs[type]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 it-&gt;lvl++;<br>
@@ -374,6 +384,13 @@ nvkm_vmm_ref_ptes(struct nvkm_vmm_iter *it, bool pfn, =
u32 ptei, u32 ptes)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc-&gt;type =3D=3D SPT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvkm_vmm_ref_sptes(=
it, pgt, desc, ptei, ptes);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc-&gt;type =3D=3D LPT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (u32 lpti =3D p=
tei; ptes; lpti++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pgt-&gt;pte[lpti] |=3D NVKM_VMM_PTE_BIG_VALID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0}<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h<br>
index 4586a425dbe4..1fe7915b8e87 100644<br>
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h<br>
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h<br>
@@ -46,7 +46,8 @@ struct nvkm_vmm_pt {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0#define NVKM_VMM_PTE_SPARSE 0x80<br>
=C2=A0#define NVKM_VMM_PTE_VALID=C2=A0 0x40<br>
-#define NVKM_VMM_PTE_SPTES=C2=A0 0x3f<br>
+#define NVKM_VMM_PTE_BIG_VALID 0x20<br>
+#define NVKM_VMM_PTE_SPTES=C2=A0 0x1f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 pte[];<br>
=C2=A0};<br>
<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--0000000000000b32290649010186--
