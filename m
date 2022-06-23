Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9985573A2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 09:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20BB113BC2;
	Thu, 23 Jun 2022 07:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A827113BCE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 07:13:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i18so18140989lfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 00:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=HKFgy2ePSsWBd5WuvWRCAAgtGzNsGiovMzKJw9WuAWA=;
 b=YHqD16i1gy7q5AU1NQ3/V1N310bWjVPrieL93A3boF19PSadG6dWxkVlfmG842U47g
 74r/2zMgBXhaCoa8PyF27NUbb49451lSdYuvYHjO1SH4Z7CLaEO7qbFB8v5IYhWSq3in
 KAlV+lxQcrfa+6sMhYT/L1EEvAMQgiFeRS4Ppis5ftyOo2GJrVhQLlSIG4NkPzHWUcP0
 n5aIft2UUuStF45XBP1WPOoleMZ3qWKjk3iqQKtHYN7iDfelqf+/GRsPE5atiyleDAH6
 FLhnCHEU0i85+0ALhH3ZHYriyxt0/Wh58BDqsU/4rm1kv/x79LyFg0fQpqcCnbxFvr39
 M9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HKFgy2ePSsWBd5WuvWRCAAgtGzNsGiovMzKJw9WuAWA=;
 b=FEGym+5Q21tNPH87FCvW1eKPqs0jtt7msagFu5DnzJIjtP8qk+z0buM5nfT7fGhdnz
 9rAMIUgDyan0YwFlQAF+wnEzL4cby22SmJ99Orq4Gb4sGMcGjKZJv41d5xz/redbMnkN
 /XMbpf9t/4TvvL3eWyAB9efi/1RNj/iAwSKZNeqju65NnTMs6/AmT3Mfp9Qwke44YfPF
 Fee2xOWcG1mNMUeEoP1SWaY4y+osbpft/sTX3wcDX57GuMh0Pwh/J94DreHQNCIf1g2I
 7imlSVbttANMJRfqihkMKLvD0l605CZA+AX3u4w9lN7C2/u4l+u1qdrtf+cWYnKnAXCl
 2xEg==
X-Gm-Message-State: AJIora/7L0E+6bKmljDEdtplxOTK7nXNLz4Lh/xvyxy9R1IyzciDGTYi
 1sNJyHLo5X1utfidTBLEuvg=
X-Google-Smtp-Source: AGRyM1tQKqOwQskRGxDVvZp5ecHNyZRyMLFkiEcuNVszS7TJ5maJeX2lgHeXtpbyA72kS7dUtzTlrQ==
X-Received: by 2002:a05:6512:3f15:b0:477:ce24:4e1f with SMTP id
 y21-20020a0565123f1500b00477ce244e1fmr4473530lfa.355.1655968416440; 
 Thu, 23 Jun 2022 00:13:36 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q20-20020a2eb4b4000000b0025a6a8bdcc7sm1655874ljm.1.2022.06.23.00.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 00:13:36 -0700 (PDT)
Date: Thu, 23 Jun 2022 10:13:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: DMA-buf and uncached system memory
Message-ID: <20220623101326.18beeab3@eldfell>
In-Reply-To: <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QmOTkLNi2kJF4_bkXoJdUR3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/QmOTkLNi2kJF4_bkXoJdUR3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jun 2022 08:59:41 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> The exporter isn't doing anything wrong here. DMA-buf are supposed to be=
=20
> CPU cached and can also be cache hot.

Hi,

what is that statement based on?

Were the (mandatory for CPU access) cpu_access_begin/end functions &
ioctls not supposed to ensure that CPU cache is up-to-date / CPU cache
is fully flushed out?


Thanks,
pq

--Sig_/QmOTkLNi2kJF4_bkXoJdUR3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmK0EpYACgkQI1/ltBGq
qqcw7w//QVXYLoKhIBnGN34yEmHzycIRr1pys6yOt0O61O+o3mO+5B9sUxkiNZT7
AOtn1CRxJMBYC0sTSWhi6TZyN6MP0GW80CMGtCLmLCb8T19U7CBsBflVtc8e0aM8
GXiSbIW3BJEt2pXAUa+jVDeI7TyVjw6it6k21PVv6EV/iIR84BYuGZIBbOwRi/UU
A3aNvFyTfhbi5fHwZJxgkv6SLsRBgTkHnyAVOcJ90FJgz1mHYONcsZKGp6q77tAt
r9+jBo+5HWfPZSzAAcJg9tIGr77VNjq0YX/jj4R7MWd5Sb2EPFR0df3mXvIIQNR+
7LqslvdNaaQkfh23bcGXvtbOgceboy+DUj/rPvC0eHQnGUop/hTJySw9p6n7QU3Z
q8ubKBzmWllcwNhwnb/aun23LBuBh4Nx5RI+oxg8Bwz4uvMg9WK0cjGm+AInFLTU
+GmmjUw2NK7jLF13Iu8n+5Z2SsxjAojoIsKQSkdH1buFdEcQNp2lzZH8RjIAkOGC
4D5AQMl0t891tH0XXRWxC3HOGi1RdfS1NzgG/mrG41NLdCG/bq79xsP56cFVUceb
ACGl3uxrxlabcFxEiP9peR8ebtEnRn0ZCRcpd02RgIgsM7+jzuuOZ8EdBGBK+fVz
fuz2KKG0X7sQT/03x7Zbi0VQWf8SAR1C9JBkiJsLjvOkFBZV4Gc=
=WrtI
-----END PGP SIGNATURE-----

--Sig_/QmOTkLNi2kJF4_bkXoJdUR3--
