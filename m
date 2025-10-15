Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF6BDE7D9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 14:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004D610E7AB;
	Wed, 15 Oct 2025 12:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ichb2kDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31F910E7AB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:36:07 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-591b99cb0c4so411092e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760531766; x=1761136566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXqZCy2SyArQfSZB6+/vhy8c6RWAc9H5KTcnkJHJQFY=;
 b=Ichb2kDc9vIpuHnMmoCciYPdhTJlSkx3uKLLiYPlTK2pmsSH3iUZv3XQfschPz7098
 nLMM91rrSyhMH9Tu8nCWnXfkeeXjFirD4/FiYjpGF23b95CPYP3A0mFVoZtzRSIWyGuS
 dhAeNCw5w3iGf07V6T1lcJfk4Lo1YavYMaK+pKiECvo77MIy6/oyaqeLXW9yfK6DVhqM
 46E/i6gup310WAlgFg8u6OMlEoHIs13cC7RRi4A6235aBxZ6PPpwuiPnMLnbJ/Afjlxj
 8QXNutdziWJ0KwpgUx/XzkUcAzt9IhYem0m/KjuXjjr/kdVUW8lPIiPFEAS8vtj9YRO2
 11lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760531766; x=1761136566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXqZCy2SyArQfSZB6+/vhy8c6RWAc9H5KTcnkJHJQFY=;
 b=GBvCnJeGnl8V17PUJ5V7UkKiCA8vCd2kqDHHu4tE1DcTy6J0DmD/MsGKhMZdb79QSD
 SnPBz4pUxBs540554jFuzI/sBfRVFwX20IBFGcmqGnRths2Yxc1YjoSFoNse8cDOQQbv
 f4Uejfv3IIXBQ6422Sw52MaIZcGSaw+aKhAt4UGBxMZUx7k4WvZfIIQ1HdxRX0bEp/Ff
 Zg2Q/h5Y/nynIDfGUwGIv1PuWVd2M+DrHCSY+ET1T3eiJHXEi+m8FGLsxgmKAdISqJuS
 RQK0L66e9gK1588RSTDpeAZ6cgGaRhStQGYDuGdVyDZtOhqBShbzJTZHuy1ozaWERl6P
 Un6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJHZl0PKPswu4FVLQFUZ6WeRsNaB122kDhLIz1in7T9jZk1yYPcdlwDASt7gR50s7WFsvMCBRh0Qc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk1jnraPndqU+GYMddEYZelrvOeW9ocs54pgLpcAL4EvgZa0+W
 ZOpHvD0DmvqKTDS76V0riq3Il2WOuw/p9pj1aKvCdoRpK14qmSLjX4t3A9JdOSODr2+nGkjS/he
 F6VU60kmCZXxGimIUOj96w1T92YUPBpE=
X-Gm-Gg: ASbGncs8vDhYY+D610CPegvyNoPW6Xo6zAvl5i12itmKKCCv53q8WSoHOBdJimDUkfI
 WcJ/HvclLpa0AmnWpg0LOHLpnnt7B9yqDvwn9IovR83k7qaIWn8/ZOdRaw8rrpclidlNNa0MVFa
 91PKMqTajOKgEX9gTbmKPuyl4fB17sfmR/m6EF2u3WZE1OKwWTAPZJTrWXaF3bQ0vqpe0km4+56
 YZPTuHJbsSS7jiP8fIFagLRLx+eFe4y0s3A8BR9Em4xiKJj
X-Google-Smtp-Source: AGHT+IHpJJ3i4VE7K63V7qp2FsxwGna5n/UOWX+WqUQGecNnl4cdq5PAcjc23PWmzxHfk1E5P7xRzKbuz8NuSN92NCQ=
X-Received: by 2002:a05:651c:f1c:b0:36d:54b3:9f75 with SMTP id
 38308e7fff4ca-377795d5fe4mr5645081fa.2.1760531765871; Wed, 15 Oct 2025
 05:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-2-zhaoyang.huang@unisoc.com>
 <f807f3bf-a05d-4e0f-af4c-bb0167dde51c@redhat.com>
In-Reply-To: <f807f3bf-a05d-4e0f-af4c-bb0167dde51c@redhat.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 15 Oct 2025 20:35:54 +0800
X-Gm-Features: AS18NWBHy47J7vqNuZdMWmFiioMnHOdN9PsD8vuUcKjXC1NTUEoBMVAQrHP3CgE
Message-ID: <CAGWkznG=DAXz5s1gAcs9=OKJC0v0KwB=FK=mKL-c1DSw3jGqfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: call back alloc_pages_bulk_list since it is useful
To: David Hildenbrand <david@redhat.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@techsingularity.net>,
 Vlastimil Babka <vbabka@suse.cz>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com
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

On Wed, Oct 15, 2025 at 8:16=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 14.10.25 10:32, zhaoyang.huang wrote:
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>
> Probably the subject should be "mm: reintroduce alloc_pages_bulk_list()"
ok
>
> >
> > commit c8b979530f27 ("mm: alloc_pages_bulk_noprof: drop page_list
> > argument") drops alloc_pages_bulk_list. This commit would like to call =
back
> > it since it is proved to be helpful to the drivers which allocate a bul=
k of
> > pages(see patch of 2 in this series ).
>
> "Let's reintroduce it so we can us for bulk allocation in the context of
> XXX next."
>
> > I do notice that Matthew's comment of the time cost of iterating a list=
.
> > However, I also observed in our test that the extra page_array's alloca=
tion
> > could be more expensive than cpu iteration when direct reclaiming happe=
ns
> > when ram is low[1]. IMHO, could we leave the API here to have the users
> > choose between the array or list according to their scenarios.
>
> I'd prefer if we avoid reintroducing this interface.
>
> How many pages are you intending to allocate? Wouldn't a smaller array
> on the stack be sufficient?
Actually, dma-buf is the main consumer in android which could occupy
half of the system RAM(mainly by multimedia which passes the memory
between GPU and display, camera driver, NPU driver etc). Dozens MB is
quite common or maybe more. This commit is proved to be helpful in the
scenario of camera APP cold start which allocate around 300MB memory
in an 6GB RAM ANDROID system
IMHO, page_list could be more efficient than page_array in memory
perspective which is an uncertain factor than iterating the list
>
>
> --
> Cheers
>
> David / dhildenb
>
