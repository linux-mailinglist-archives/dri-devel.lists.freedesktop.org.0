Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BC393C856
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 20:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC58710E152;
	Thu, 25 Jul 2024 18:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VzqG/Lwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A37610E152
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 18:29:08 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e0365588ab8so1177302276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 11:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721932147; x=1722536947;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7H82UX58ZrrZtRiHAVe/+LcpHIvYYzG0b2RLD43YNbY=;
 b=VzqG/Lwf8E6bQqs4FH1R6qM45H7wl668CHdj+yNF9MWmL+PuVmZQi0qL5BOhRjGFK/
 JTCJs1qYfkF5coBXYUkTn+SORKI58ZDINZyDlN6wp9UnY/k7A7FF5ybpSfon5R783ovY
 4Nf73nHv1Pzc4NF8/Vuemr6iS7d/U2mN9s7Oh8+1XMDwLcXro0EtKCmHsGanVHd/rWKV
 HFByyQAP2fToBi3swkSdgdXWFko3nOaK1LmKKaWMdmOt3usqcOKdtVyouDiVCye+vX8t
 iqrCQSgGWvZ6uf231di5bIpCN1iZV8FWx7n/I9F0/w6/MkvWhOPaCliwWC8VBf0xp6Be
 KV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721932147; x=1722536947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7H82UX58ZrrZtRiHAVe/+LcpHIvYYzG0b2RLD43YNbY=;
 b=ryzDlLpuaMmR9Uj/IahzfjIDvpNokHRN7KjsWCQjWkLOHpWM8lgR+ImtBJubQze4q0
 hyKlwg1lg7+yXMkgRt6PO0N4pdDXXQh01mgq0+9eBYfe9q91IgouzW3sIH0wZV5AuwDM
 zhEkcZ5LY7Bpc8wO1LRIITGa667XFfdX4N1t8o6fpJ4mFMFOevSJ/dr3P3yjlWZDH5de
 mo2LfNtPuZeknNnqXu8CRhFTNdPoQF7btklHu5j9T7TANTfjBwPmrnarxCYlaMr9P8uI
 F/aQOFQgFHhhEhCRt47iem8wn0L4ODhdq0iGd7zqA81jkFP1weLXOkTpbpdkYzqaxbuP
 OFYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtHIVqNtx62cuPOtWIXc/Q2OmU+wJMngBCwkz01V5E9XVHqagyCvtqR1LWZPu4Zyl4ZBDTOrsYjHHojOtniIa+L0dTFMGZnI583AvXrgIC
X-Gm-Message-State: AOJu0YzMIJKgNuKmq78kyYe5MVoyP7ytPeZqfTuKfymaJvaPSjvbic/2
 RHIP2Si29+ESP5H+De2RtjOmrXX6mipDX1Re1YjJ4k4DLlj/YXZHmMQK+uPqmW1+9cHmKw9w/Se
 CqljT3/b8mMKlMkhawvT6r53AWjbGOJC9COtB
X-Google-Smtp-Source: AGHT+IGItijrenPjAmbxU5/Nvgn7ovQBfsTeRuhZp2oL9F1LlVeqZKuRyX0WfNygkWhlg9mziIYn9ttT+ix/HaljKmM=
X-Received: by 2002:a05:6902:c0b:b0:e0b:1519:e0da with SMTP id
 3f1490d57ef6-e0b23230e16mr4766336276.52.1721932147352; Thu, 25 Jul 2024
 11:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
 <20240720071606.27930-5-yunfei.dong@mediatek.com>
 <8b143d1c-edf9-4b2c-a382-75328156a7b0@amd.com>
In-Reply-To: <8b143d1c-edf9-4b2c-a382-75328156a7b0@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 25 Jul 2024 11:28:55 -0700
Message-ID: <CABdmKX2SqrUE1dnZWFnzMYLYqScoCrM0JDxc3YuzQyyV43wDHg@mail.gmail.com>
Subject: Re: [PATCH v7 04/28] dma-buf: heaps: Deduplicate docs and adopt
 common format
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

On Thu, Jul 25, 2024 at 4:52=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.07.24 um 09:15 schrieb Yunfei Dong:
> > From: "T.J. Mercier" <tjmercier@google.com>
> >
> > The docs for dma_heap_get_name were incorrect, and since they were
> > duplicated in the header they were wrong there too.
> >
> > The docs formatting was inconsistent so I tried to make it more
> > consistent across functions since I'm already in here doing cleanup.
> >
> > Remove multiple unused includes and alphabetize.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > [Yong: Just add a comment for "priv" to mute build warning]
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Since this is essentially a complete independent documentation fix I've
> gone ahead and pushed it to drm-misc-next.
>
> Regards,
> Christian.

Thanks!
