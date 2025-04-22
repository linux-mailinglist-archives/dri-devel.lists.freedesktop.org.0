Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E98A97A64
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 00:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93F10E63C;
	Tue, 22 Apr 2025 22:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OJKQaMEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D94510E63C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:23:04 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30bef9b04adso52807101fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745360583; x=1745965383;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2uRwWrb8ebhkycf61ed5XHbka2o5yaZh1hlxBkjDhc=;
 b=OJKQaMEsHQrsUxNUeCnx6143YS3R9Wx/SZnPnGop9SiBUQE5f+cF1BgYq97RSulPP4
 RPPlHy+VhLF3UiCxpzNjR7J8LeOSf8LZFFDB5anWY9nFqsC8ayUgy/ejCQPwCR1dZVsU
 HxqoxobVpINVQ9b+pXRjthGdE0EYIgfcX8EVWinq7pW43fuQbVbickv5guTzPH82oT+Y
 6susH7lo6iqgPqQIzt4g/dEvMYeFRrvZt3cZ3yUpAiTnp8Dbh8ewHOMjQomq4HuWyWnM
 mwiVFUdkwdPYbqeuv6WM9r/Z08Oo59jvDaLaNSFw6V+t/gytV1ScxidbvCViIsVE+HGe
 rTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745360583; x=1745965383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2uRwWrb8ebhkycf61ed5XHbka2o5yaZh1hlxBkjDhc=;
 b=K8okar38G9+Q4b5/AdZfIED7cuF8ULeeW4443oMd+CvfLtDGUpb1JivskgQSf5TLVs
 5XZx//mEjYSNqAtkSUoSuNyOlUSIFKjaCcANW0VP61X0QRFt4+kER3rkrTu4EZJJzMgX
 45hPQ4Ow3ySqm4+xv/qo2j1y2mHxLv10nxhoB84pWtmWdGwikkRd9MTNMz7ycGMV7CGP
 YxlWbd1/A+Uc++jZXwYtk0ve+Tg0UTl81oAdSMyx9qRbM9w+MqN274kZ82IIVWJb/FZl
 gQ2tu9xw8N/uoW3XafoRiEo6Y61zm9YMbeUjo2a+Ue9QEhs0iN/9phvEoIBfgsh89P8/
 eIew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOofPBNDKxD7jU5PaF9dmmbhbOz0jiUi4mvlI1dQTiPURsHmYgZog0yXG4bKwzQwr1v/csVZwIbPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7O8oYohyGFQWEAsUrAdx1vnIppTIwODUTjt3ERwUJYcGFtnBK
 ZmLF+tG0YrVRGLBjT6CbRdr708JRCO2mdSDwskfMU6Po/kinejFDcIOZ24L+Xg6pkbHxSPGhmyP
 BISM2pVztZ7xw+EH3rWgjDmlpNHZnxdDqhxY=
X-Gm-Gg: ASbGncujKI+9x8PRKgkHWUD6+B6qpGtv2vZJdGGcPlAKrLKaThSilPXF00486fvfMzY
 qJ1qjvF9Hwr4kULVQnSV8fPa1CbQM02zDaXSJ9zldCg7kpID4MqEL5DnySkDKNu7cIkB7y6Ypco
 dwHOoLV7CQgwuy9YSnnq3sOJq8gh5QFqeErij1/FRl2ykfUYKH0KO1txEDyXhy
X-Google-Smtp-Source: AGHT+IGrB/MiyfMTsIh+vYbWS/FNQhnUERjXD1nH9PAly6Ako+aVzVIOOf/PQlHpqWj+hJ7n2hzR9xaSmnbnValKnS0=
X-Received: by 2002:a2e:bea1:0:b0:30b:f24a:651a with SMTP id
 38308e7fff4ca-310904c626dmr45311251fa.5.1745360582583; Tue, 22 Apr 2025
 15:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-2-jkangas@redhat.com>
In-Reply-To: <20250422191939.555963-2-jkangas@redhat.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 22 Apr 2025 15:22:50 -0700
X-Gm-Features: ATxdqUFD0eE26rdQ7w42uNdNNlbQHNUlvuTnoRS4o--E4bvf8dH1hzjOR3S0oaE
Message-ID: <CANDhNCpqSeSUkV2QvgLW3JY+Tsf_UOBjBrn4vBkYf+dvbtq2wQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dma-buf: heaps: Parameterize heap name in
 __add_cma_heap()
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
 mripard@kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Apr 22, 2025 at 12:19=E2=80=AFPM Jared Kangas <jkangas@redhat.com> =
wrote:
>
> Prepare for the introduction of a fixed-name CMA heap by replacing the
> unused void pointer parameter in __add_cma_heap() with the heap name.
>
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Thanks so much for taking this effort on. Looks good to me!

Acked-by: John Stultz <jstultz@google.com>
