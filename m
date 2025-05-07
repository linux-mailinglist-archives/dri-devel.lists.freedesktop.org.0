Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCA6AAE234
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 16:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF2410E80B;
	Wed,  7 May 2025 14:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eqnbsl2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87D510E80B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 14:14:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so4311450f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746627254; x=1747232054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNnZUmX34eCntIlv80BWyc/0QNlOJepYSEHreCjNtrU=;
 b=eqnbsl2CsAeg7ItF6wakdDPtugIU6OLEbtAwcPwq1jGLKt5/UZWkv90ej67Y10tpfc
 7PpxXkGvjtEUI/wOnrsi0vCTHtUqy2AyfottqYMfoRNy1IaX/sNvhuqDJPig8o51CRAr
 ExvfrG0qWCrXG71mcDITGehrdlRpQF9c9xjYlucJlCFPRH8M8vszX9Pt68ncx262gJ4r
 xz3JcHaKnJSDnP68Goh9N9CyrIB8a0A7LHQegnZrpy3kLxHQ1Hfbf4np4ypsQG1pqDGU
 TaDui+hKyjCz31R3ftFvZH3cLNCCgkOFYeMqWOlSVgbwR6/Ha3HMdMFvC/ANevW2WVpd
 X82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746627254; x=1747232054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNnZUmX34eCntIlv80BWyc/0QNlOJepYSEHreCjNtrU=;
 b=CmDNq8pNiT9FCNJQA9/89etPXd0QL2WkXboVSqi1d9Gi+YFLQ74Bm1Hwt7WQnNRuoA
 nRTkCPeIEWKxr8Fve3Fymf+10lO9SSoWe27+ck3ORbjfmjKlnUWHOdYNI1SI9PRfOYjz
 qMAbrr2uYY7yVTzMN9GKFcbiSPFvt/PH6KqJfsjIDnC9mr5mt6saYqibjFto5sOGi3/r
 G4b8T0xBMCr/sg4NPcKQd7+fT1yxn+5hH+q0jz6dVLkicOn6QalrjioJ+rApogNLV6or
 2fuURFMMSD/lub8zDlM5qi3duW/F1Y/1Wv5fa2ETS8cCuwq6RGNQwu7xp9ElFICqgsoG
 hfDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQzRulQOpjZkwM/7jtGR1fUjWfbxwy3A7ZHvnTvAXmoXX0EVoKfBzU3RvjkM6NbYgwyIgS7uDB3WM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlyqS9ff2A8NcVuL0U/QvMDrbARxdi4uzw8uy5aXryXNDVxX++
 amqFXESXyuVQmHCM7uUtT3sMSp1EbEI7EdCdH5OEtgkDOO2K8G1US/GLqyJKFL0JKtkKddEiqU6
 Itf5O0hzE+7kQh8zkH7YDgzaqGyc=
X-Gm-Gg: ASbGncs3PCvQXS+J6r2NWuEYj32Ay+DmlCpugEScyzGI40vNpuGACqFV7yN7Pqt0h8r
 Q+WZtEOG4SvcsK+CFbDe4pm0HfQ6UPwffChY685FyHj0G6gNDvlHNbzl2zg+zzZioEHXqrsTDqb
 1txKujCQ1uJWDaX2Xk80hWMHpfHAl5E/kCLV7q0vQgzGoLb4GEsdOuHLyPMj/M
X-Google-Smtp-Source: AGHT+IE7YwupMe0PY2KfsKAdsd0JUDs8JdlQnJurFBmdXtxSRg25+HLcgrkwMi498eBlgYRhQzzHmmHYGwbzShYGjPA=
X-Received: by 2002:a05:6000:220d:b0:3a0:b940:d479 with SMTP id
 ffacd0b85a97d-3a0b940d807mr45656f8f.53.1746627254068; Wed, 07 May 2025
 07:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250507001036.2278781-1-tjmercier@google.com>
 <20250507001036.2278781-3-tjmercier@google.com>
In-Reply-To: <20250507001036.2278781-3-tjmercier@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 7 May 2025 07:14:03 -0700
X-Gm-Features: ATxdqUEf5_19Jno_4-zzyhqzCAe0qZhQRxDd8zooZHFiVvDpL9j0mU5OqeyoxoQ
Message-ID: <CAADnVQL2i87Q4NEX-4rXDBa_xpTWnh=VY-sMCJzK+nY0qogeqw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/5] bpf: Add dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf <bpf@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 android-mm@google.com, simona@ffwll.ch, 
 Eduard <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Jiri Olsa <jolsa@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>
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

On Tue, May 6, 2025 at 5:10=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
> +/**
> + * get_first_dmabuf - begin iteration through global list of DMA-bufs
> + *
> + * Returns the first buffer in the global list of DMA-bufs that's not in=
 the
> + * process of being destroyed. Increments that buffer's reference count =
to
> + * prevent buffer destruction. Callers must release the reference, eithe=
r by
> + * continuing iteration with get_next_dmabuf(), or with dma_buf_put().
> + *
> + * Returns NULL If no active buffers are present.
> + */

kdoc wants to see 'Return:'.

See errors in BPF CI.

And patch 5 shouldn't be using /** for plain comments.

pw-bot: cr
