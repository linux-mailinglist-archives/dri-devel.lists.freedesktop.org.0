Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5172708ECC
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 06:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809E010E038;
	Fri, 19 May 2023 04:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B0810E038
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 04:22:40 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230519042237epoutp0104f44d99f50584de172586e84b898bfc~gcK8N1YdC1739517395epoutp01J
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 04:22:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230519042237epoutp0104f44d99f50584de172586e84b898bfc~gcK8N1YdC1739517395epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1684470157;
 bh=ITYT/zTu9Hb5IBwSbYI63NulOS+xSN7gToo3UM3A0Jk=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=l70Jn0/R/bcmW7hNbIvY8GAWxgbPRcPV1QNVFIiWZvxLEFub1A+LCPhvn9cjftN76
 EXQ2Q/H7zm+oAzRt+CxjfVJvRsDbadIm9CVYoLMKgSXES2u/vQjhiUl9GK10Bafq6x
 u1GkEkCeAJRbdRmVNyQlyMjzfte0HZ2NwHAnSjJI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230519042237epcas1p17139404bdc6a61fe638e6bfd6d5718bf~gcK8CZtXs0628806288epcas1p1K;
 Fri, 19 May 2023 04:22:37 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.231]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4QMtwr4r6yz4x9Pq; Fri, 19 May
 2023 04:22:36 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 17.EB.18603.B89F6646; Fri, 19 May 2023 13:22:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230519042235epcas1p2034e17985937c5aa61af8cecfb39fd9d~gcK55ov7k3163631636epcas1p2n;
 Fri, 19 May 2023 04:22:35 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230519042235epsmtrp22a42fab41555fa276446aa63d7648ae2~gcK54nLJV1854218542epsmtrp2x;
 Fri, 19 May 2023 04:22:35 +0000 (GMT)
X-AuditID: b6c32a36-107fa700000048ab-05-6466f98b6d3a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3F.29.27706.B89F6646; Fri, 19 May 2023 13:22:35 +0900 (KST)
Received: from inkidae002 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230519042235epsmtip1b617084ccd944e4ae70ee99d1be2c10d~gcK5s9Fa10312003120epsmtip1x;
 Fri, 19 May 2023 04:22:35 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHi?= <inki.dae@samsung.com>
To: "'Andi Shyti'" <andi.shyti@linux.intel.com>
In-Reply-To: <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
Subject: RE: [PATCH] drm/exynos: vidi: fix a wrong error return
Date: Fri, 19 May 2023 13:22:35 +0900
Message-ID: <04c401d98a09$898df160$9ca9d420$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQGxg44ZUhVLui2gbH7rU6491MBBtQFXvNCqAeUomBavlyG/YA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphk+LIzCtJLcpLzFFi42LZdljTQLf7Z1qKwfnVKhb3v3YwWvR2LmS1
 uPL1PZvFjPP7mBxYPDat6mTzmHcy0ON+93Emj8+b5AJYorJtMlITU1KLFFLzkvNTMvPSbZW8
 g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0yc4A2KimUJeaUAoUCEouLlfTtbIryS0tSFTLy
 i0tslVILUnIKTAv0ihNzi0vz0vXyUkusDA0MjEyBChOyM2Yd3sJS8FS4ouvPf+YGxl38XYyc
 HBICJhLn/91jBbGFBHYwSrQvLeti5AKyPzFKvFiwmBnC+cYosbHzNitMx+VVNxkhEnsZJWZ8
 uwNV9ZJRYvHMuWwgVWwCVhKH/1xnArFFBPQljq7oB7I5OJgFSiRWzuUGCXMKGEhMurWRBcQW
 FrCXuPGvhxGkhEVAVWLXFGWQMK+ApcSdRVOZIWxBiZMzn4CVMwsYSSxZPZ8JwpaX2P52DjPE
 bQoSP58uY4WIi0jM7mxjhrjASaL16G2wMyUEfrJLvHrziQmiwUXizfotULawxKvjW9ghbCmJ
 z+/2skE0TGaUuHN9BQuEM4NR4vDP64wQVcYS+5dOhupWlNj5ey4jxGo+iXdfe1hBvpEQ4JXo
 aBOCKFGSOHbxBlSrhMSFJRPZJjAqzULy3Cwkz81C8twsJA8tYGRZxSiWWlCcm55abFhgBI/u
 5PzcTYzg5KhltoNx0tsPeocYmTgYDzFKcDArifAG9iWnCPGmJFZWpRblxxeV5qQWH2I0BQb3
 RGYp0eR8YHrOK4k3NLE0MDEzMjaxMDQzVBLn/fJUO0VIID2xJDU7NbUgtQimj4mDU6qBSXfr
 CnvPyOfZdxYpZD4+38p6w/NA/y7LdOuuF9wr7HoWlgW81d1w6EZJWeyPPEH+E0XGvFP4mg7s
 +KBRc6+rZNUC34u6yxPF32159e7C7/z3vhK/zMKE+qd+X367y/Cg1F+NkAB5ueUHH+79U5hz
 JPAiu7K0oMs0K31BxsTfc8T2Bh1NfOVQ8Zo1MqaUiynk86IgzvVFtp0bc39IxFfVrbXYc6nn
 3bayM/bGLDEqcurJF8/YXzJ16nv6b7njwSThb04SEqyaj5yndhgH2we/zZu5UTl/vt+G23LS
 LMGWzSf6tSzaZp1u+LhtmdoP5uWT/1/t/tO7KMD/b/y8TzE3AjaYM4eEuCz5Ezx33YWjSizF
 GYmGWsxFxYkAc5heDhcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnG73z7QUg8NfuSzuf+1gtOjtXMhq
 ceXrezaLGef3MTmweGxa1cnmMe9koMf97uNMHp83yQWwRHHZpKTmZJalFunbJXBlzDq8haXg
 qXBF15//zA2Mu/i7GDk5JARMJC6vusnYxcjFISSwm1Fiye81zF2MHEAJCYktWzkgTGGJw4eL
 IUqeM0qc2HuJFaSXTcBK4vCf60wgtoiAvsTRFf1MIPXMAmUS33fHg4SFBNYzStw+EwJicwoY
 SEy6tZEFxBYWsJe48a+HEaScRUBVYtcUZZAwr4ClxJ1FU5khbEGJkzOfgJUzA13ZeLgbypaX
 2P52DjPE9QoSP58uY4WIi0jM7mxjhrjGSaL16G3mCYzCs5CMmoVk1Cwko2YhaV/AyLKKUTK1
 oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4OrQ0dzBuX/VB7xAjEwfjIUYJDmYlEd7AvuQU
 Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGpjEZOWdJjc/
 V9rbMONx8f64xxN/s7y/wBd8t1VnAcM+a+cz7JU1ll7G+3YcPOAXIPTiYHWc7+SQrxc1ZUzd
 Td5cZBL/uP7fAQ1blYVaZtKfU1/+/+62f6Xow2ebfj7aeinV73Ovcu3q7GUm+y70Bt/JeHt6
 nxrzXlXG1VciY4sbQvUats0OWr/Rb9e+znOCLy+kc/MLOvccu+QkJvUk/Fa1obOjwY2KuxYT
 bk1s3izj6OO++HadrGf6Aqm5OVI7DNYnCCw+8LSlVPvmt+z9t8VcEn2aoppqPitOildTm8uc
 5uAS8oBlkusjxVMfFlhVSbzQKf/RUWCyZW+O/+Fmn1fX/ni+n1GR9nmvZ8cMk0olluKMREMt
 5qLiRADUEyD//QIAAA==
X-CMS-MailID: 20230519042235epcas1p2034e17985937c5aa61af8cecfb39fd9d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7
References: <CGME20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7@epcas1p4.samsung.com>
 <20230519000407.60744-1-inki.dae@samsung.com>
 <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
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
Cc: linux-samsung-soc@vger.kernel.org, 'Andi	Shyti' <andi.shyti@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi, :)

> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Friday, May 19, 2023 9:27 AM
> To: Inki Dae <inki.dae@samsung.com>
> Cc: dri-devel@lists.freedesktop.org; linux-samsung-soc@vger.kernel.org; Andi
> Shyti <andi.shyti@kernel.org>
> Subject: Re: [PATCH] drm/exynos: vidi: fix a wrong error return
> 
> Hi Inki,
> 
> On Fri, May 19, 2023 at 09:04:07AM +0900, Inki Dae wrote:
> > Fix a wrong error return by dropping an error return.
> >
> > When vidi driver is remvoed, if ctx->raw_edid isn't same as fake_edid_info
> > then only what we have to is to free ctx->raw_edid so that driver removing
> > can work correctly - it's not an error case.
> >
> > Signed-off-by: Inki Dae <inki.dae@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> > index 4d56c8c799c5..f5e1adfcaa51 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> > @@ -469,8 +469,6 @@ static int vidi_remove(struct platform_device *pdev)
> >  	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
> >  		kfree(ctx->raw_edid);
> >  		ctx->raw_edid = NULL;
> > -
> > -		return -EINVAL;
> 
> It doesn't look right to me, I think the correct patch should be:
> 
> -       if (ctx->raw_edid != (struct edid *)fake_edid_info) {
> -               kfree(ctx->raw_edid);
> -               ctx->raw_edid = NULL;
> -
> -               return -EINVAL;
> -       }
> -
> +       ctx->raw_edid = NULL;
> 
> because "ctx->raw_edid" points to a non allocated memory in the
> .data segment and you cannot free it.
> 
> A follow-up cleanup should be to remove the "const" from
> fake_edid_info because you are assigning its address to pointers
> (raw_edid), so that what's the point for having it const? You are
> just fooling the compiler :)

Thanks for review comment. 

"ctx->raw_edid != fake_edid_info" means that the edid sent by the user through
the ictl system call - vidi_connection_ioctl - is used instead of fake one -
face_edid_info.
In this case, ctx->raw_edid object needs to be released because ctx->raw_edid
object is allocated and the edid object sent by user is copied to the ctx-
>raw_edid by kmemdup(). :)

Thanks,
Inki Dae

> 
> Andi
> 
> >  	}
> >
> >  	component_del(&pdev->dev, &vidi_component_ops);
> > --
> > 2.25.1

