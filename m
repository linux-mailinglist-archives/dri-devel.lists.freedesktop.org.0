Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB7EA74EDC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 18:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F51210EA73;
	Fri, 28 Mar 2025 17:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="imFMMWOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BB610EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 17:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743181845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R2fSAHOj0VGuIRqOkJePWxGg27k68vcRR5wBs2WTkXY=;
 b=imFMMWOFK14WNvF7iF+wNKOBtw/y4j//81lEnzt7NAnoT35LW1dwmtOF3OazEu+pGbz7I+
 tPbcLQ4Qs9qheeOp/0CPpCBniPWlG6XOZ8wKkoXemlc7waSq2lKQjiZkzTu0AHP/qjyfZG
 UgeaMRCpyVpZcsrkclwQzppElID7O08=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-9diIubqTPI6J5K4UQi6MTw-1; Fri, 28 Mar 2025 13:10:42 -0400
X-MC-Unique: 9diIubqTPI6J5K4UQi6MTw-1
X-Mimecast-MFC-AGG-ID: 9diIubqTPI6J5K4UQi6MTw_1743181842
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f79c1cf49dso37297237b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 10:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743181841; x=1743786641;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R2fSAHOj0VGuIRqOkJePWxGg27k68vcRR5wBs2WTkXY=;
 b=oO7SUccEvXKYVcuQneQ30O9qLVryhBSJYnXJM+pkTiJaTtgYYoz+dHA4EqQoR0hcVD
 hUP3ydlV4go1J7641T7UMtwol+s1fX2VNfo0Z/7aQThAM4TJtA3jEeyy/w89C0/JB2w/
 QidBe6JXWEtY20XW2yuUnHTwUceafdU/edA92s+OhUZygZXRQRLFRYIeTNzLy5e7U5OL
 TmgBvYSA9dd+mBigs1DvbHxTgVl/72Ak6LF6mVw/rJUUBif7IS7f1VCUgD/79blnu/LV
 /dRV+DpmXQ3ktjM9Lhjqr8ZLy4t9uZR6PXxA2HlufbzGt8RzNLspgwietHiJTW9rzKbY
 lGuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlx6q3bj7FZ1/pRaAH+l/zgWqQDdLBTUBagHzlodRm4OSlzKLpklWUVLgySCrQoUeCB2tSA4e5I88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfDeNXZLYLQaZk7uEjFulMjEYMWDN45qzk5ie3ys+LYugdRzJK
 Hlijg2/SVdUfyxBbJ98sujpUNf4q2QbLZcE160yOwckOLxA2n5pM+qJieCeZTD22JPDiy3CB019
 SHeDJFVVMMIdYtN4C1eMh/AfD5UnTCwqW1mENDCSkRP8z5lrjnjDku625D6rslEHPeqsthKtCZp
 bb5yrzqfhYCk5SWbyeFOvfElnB3WVNxyhmAqPSvmgj
X-Gm-Gg: ASbGnct5qjPfkG3S6tHZgTEV4azkr6rnq2FhN8CUrrD5Lnis72zVlqwncEhh6pGAH16
 JYJO7HWNIjH/sHxvl+Jbk+I2Kca3+ROb5a3meWUmHH8/gvnu4b7tFqPksG8Ro/SkjTylY6Sk=
X-Received: by 2002:a05:690c:660c:b0:700:a5f4:d1eb with SMTP id
 00721157ae682-702570d4d10mr2242697b3.3.1743181841528; 
 Fri, 28 Mar 2025 10:10:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+QWy61456v80Dljw1bQxwKk51BxVBucA3YOa0CauDcKeAAC9Mz0hbDSgUUbdrStYyNcD4AHxkU4SE0BVuG1M=
X-Received: by 2002:a05:690c:660c:b0:700:a5f4:d1eb with SMTP id
 00721157ae682-702570d4d10mr2242267b3.3.1743181841099; Fri, 28 Mar 2025
 10:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
 <20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
 <20250328095351.7bac2d4d@booty>
In-Reply-To: <20250328095351.7bac2d4d@booty>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Mar 2025 12:09:08 -0400
X-Gm-Features: AQ5f1JpqJH_9pDL3PAqHp2NmZd92ITaXXgIXKiILLV6NUlNVPqznOEteY5w_9iQ
Message-ID: <CAN9Xe3SzU0AohuBnyJtE0UWFkrW0iMGKH1F8cuUZYLZ-vbfkpw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panel/panel-simple: Use the new allocation in
 place of devm_kzalloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vkTbuGs2djlPI3NGGP5n1jfGljGEWajUas6doX_XLxQ_1743181842
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006b05ec06316a2631"
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

--0000000000006b05ec06316a2631
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 4:54=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com>
wrote:

> On Thu, 27 Mar 2025 10:55:42 -0400
> Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> > Start using the new helper that does the refcounted
> > allocations.
> >
> > v2: check error condition (Luca)
>
> Here as well, when you resend, move the changelog after the '---' line.
>
>
Hadn't noticed this. Saw some other series that do follow this method. I
will make this change.

Anusha

> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000006b05ec06316a2631
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 28,=
 2025 at 4:54=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@=
bootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Thu, 27 Mar 2025 10:55:42 -0400<br=
>
Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_blank=
">asrivats@redhat.com</a>&gt; wrote:<br>
<br>
&gt; Start using the new helper that does the refcounted<br>
&gt; allocations.<br>
&gt; <br>
&gt; v2: check error condition (Luca)<br>
<br>
Here as well, when you resend, move the changelog after the &#39;---&#39; l=
ine.<br>
<br></blockquote><div><br></div><div>Hadn&#39;t noticed this. Saw some othe=
r series that do follow this method. I will make this change.</div><div><br=
></div><div>Anusha</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
<br>
Reviewed-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.com"=
 target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000006b05ec06316a2631--

