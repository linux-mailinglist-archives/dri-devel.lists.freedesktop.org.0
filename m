Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0FAAA70C
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 02:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB61710E12B;
	Tue,  6 May 2025 00:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A/MbJv49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B8E10E12B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 00:24:53 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso34150255e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 17:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746491092; x=1747095892; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=alMo7B+Sr/59Du5rvegXFc8Zcs/QVVYNwTJ/hgL1bz8=;
 b=A/MbJv49yMGX7Udx9sZCJnsrmyhVivMil9ByysUDL+JM6VvGlFRqI0+X6AD+zY4irl
 KPxqN7CMPahuB5etojAKKfmIOUuD5Anrbr/0X3bL5/eh0f2ZHUFsNtbWq2DGo0YXu5q3
 V9rDq+mwkYFJkk6S1N+4JnUzIR2uffnMPUV624RHnyNZByFKkVkkzzm3eyTYlLz9Fcij
 vSl7tqRzDJ+tF/ZsmS+tAlKg3XKWj9LTfGiazPPyfu0g5OEMk+ZICQXIbAhe6khmpP7+
 T7WAMnRbXcNOJx8gND8OO4vF3HzI3VBZS1xkJKiM+Ws2Y7hCOSpxMcbDLUArwgBpPcu5
 QfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746491092; x=1747095892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=alMo7B+Sr/59Du5rvegXFc8Zcs/QVVYNwTJ/hgL1bz8=;
 b=FeG6yBrgJ3WqmOKqd3yIyLpHOPaxbhMK86gqBMndIl86f0AlxRjoAF5WJ6IM9qvoVT
 HZKYLb7xeX+rRy59nU5BjWVsGdFogxt9dmdw9qBh9+CEU+dAe33OEosDFW/YkuwpPTef
 Sy+Y88zEqwQNkkWRwB8a+tM6BRdxE4xYCsg4V6r1nennTChcJZFWFhy3AsgPLIw6bEgr
 L+Oyvn9TNWzdfS9fNLkqszJevFZW/QjVRGw9yBvPGnKiV6jy1EAjjPhKU5jtWcO6/4s6
 nLQDtxJW/pFg9BoQcuPwFPuS3wdPaMXQRKopViq2Fvv96XT/n4MgopuHjYco7aCOQacS
 Abdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVidubh2HZZUqXr5ReuCZqlE1KYaC706JnqFTckdPo5kWudTKRdb1ePKDutLgw2xxSaJx0fakgD91Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP+6i9zKJbWB+JEy6xHJR7XvhrYwE70yUQHIY4UYXLWdPb1BJd
 FjqdxePRNSEnYeZ1cag/Ya/T8jxYhCOjI1dP3+YXAIuJhTu3ou4OOEyhDZ25WH2AzHKelMrIOJy
 pLxmWFieOzddOFPUBYo6G8EywNII=
X-Gm-Gg: ASbGncv0r3Ie6tXIDcyCBzkO765Zvl4uy8ZHcM6MqsL4Apfjo2p//oEWSeRXLOfU/Mv
 QJk1yh2hsbbsf9kPdbdBM29E/7nnq2lCLsXIkRYUCmdEj5kUmEtt1JPgnUlDeP41N6uRPE7ITCA
 QomCyh+2kVg/fPDSgAHXqc3SphqQ3PEFWfXjMGj3vMSRmZRzv/KQ==
X-Google-Smtp-Source: AGHT+IFpisAarDVCqmL4SQ9gwYM4+gMG4oHDBZFnZvyt5pgd5IHINbs0VFd1mFStWTTZZvgPPgIuW+AiPJw4Ajhtqw8=
X-Received: by 2002:a05:6000:2289:b0:391:4095:49b7 with SMTP id
 ffacd0b85a97d-3a09fd89e32mr6735387f8f.25.1746491091758; Mon, 05 May 2025
 17:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250504224149.1033867-1-tjmercier@google.com>
 <20250504224149.1033867-3-tjmercier@google.com>
 <26ca8ddf-0d78-462f-a47d-a1128b2e058f@amd.com>
 <CABdmKX2iNk22h-KxUr4yvZO80yeRRjMfoC7yjiZ-aR_f1k402g@mail.gmail.com>
 <ec43f447-095e-4baf-8610-8279b565f162@amd.com>
 <CABdmKX2Tpv8vpDDZ+wcdrWuijfC1wkNhJQxVSC9trPkzBLN4tA@mail.gmail.com>
In-Reply-To: <CABdmKX2Tpv8vpDDZ+wcdrWuijfC1wkNhJQxVSC9trPkzBLN4tA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 5 May 2025 17:24:40 -0700
X-Gm-Features: ATxdqUHDB7Y3bq86ORp3ezfiMZIn0_EShKe0qk7UMyPGPboNnGF9l2fKY3gc3nw
Message-ID: <CAADnVQLqv-ZpoQEhk2UwvSZorSLcjgF7qLD76oHguH5-GcSXxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] bpf: Add dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>,
 Song Liu <song@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 android-mm@google.com, simona@ffwll.ch, 
 Jonathan Corbet <corbet@lwn.net>, Eduard <eddyz87@gmail.com>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>
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

On Mon, May 5, 2025 at 10:08=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
>
> Sounds good, will do. Thanks.

looks like the majority of the code will be touching various bpf bits,
so let's route the first 5 patches via bpf-next.
When you respin, please mention [PATCH bpf-next] in the subject,
so that CI can pick it up.
