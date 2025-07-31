Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C04B16B59
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 06:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B95A10E162;
	Thu, 31 Jul 2025 04:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="du2Ajuwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D5110E162
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 04:48:59 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6153a19dddfso745955a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753937337; x=1754542137;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DINYJ+FM1lqJupdP3vzGFRoexFRJ9IKZ3t9dG0gHVuM=;
 b=du2AjuwnnDw2i58K9f8XP7u8Dt5QyPKBEeVgmoujla0FbpUBSZeRD/DALsccUaaCsn
 EwozOTb3f9bX4SJAEVg9DuIIfTsGP+hVC0ehLHb2+QLYRNQKF21HmuTSmkHvQqqsf9Pz
 dEx/hC9ty2IHV7Qit2H7nSK5i1MGxtzJN1ls0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753937337; x=1754542137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DINYJ+FM1lqJupdP3vzGFRoexFRJ9IKZ3t9dG0gHVuM=;
 b=RRIDex6RSaxHGjSH/GzBzKraxUioWho7n37+99t6sKlqXVtVuSA56hcDDpuq9DYuZ9
 HyP4QVAeewCJu1L43CCtqpcQNJhXTgJ4OsVRywYvPz2EOU+QqaggEa0ZAMta+l2QQ0O+
 H8PTGRvjXkjIfSApZPwDI7oY8TQK7IiZ8o41Qvp+3QQEnqiiw6w/isOtzl20+1pAJ/G2
 +0iuylP2Swwna3ju/7vpcrnbcc7cvlLqPXBvchEcKhxnfsRc0uGADLJvWkr8271Sh5qG
 qbozwlTF5ZzClG2DOu6oAdk7rhTHcP80bX3GqDZZQMCdA+GOLX4v1ceIjCwu1aLFRm/I
 TcfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0ZkZZesa4J0ajPDak6IuQv4AwkTIGbhgezOMEScE0Rl8ZFNfvXaKOyYsJNopkGUb6m5EIWykem44=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk1Q/teGrkjUoWLnK1F9ZKWZqyVvpMdCzg/piV15sMaM8HpNMu
 adaWUSqk3Q3lH+jq8zlN2ediLjebrftaysUMb3wGB36NY7ALX4lNXyRYJiAfSFBmVpwgkbJynrV
 50+/lKwA=
X-Gm-Gg: ASbGncuuyovoiMN7i5Nsv0oxTLpi7yPlN8kRo/9RIsv/4AM6Hr7VJKiOx+J9cr4wKjb
 JNQT2RU1J1rgyg4ENVPOLWxRw4RXA2xW+Y4oPWI/b4IQIw3qJf8Ah60pk2IEBb0f+kAMzLxwZ6L
 I5SyyqMWg9oGgcGZwpCq5qjWUVbuBWh67Rm/SDb3x14uLEYIuOiMNlrl9j25dbURPYfx2iUkyYc
 bU6jwsuB50NPWdM2o62vXCYI6/SoWd7A63YZJGa56EHgorwfmzwBdsAdA49g3OJnY15LoG8fGzN
 9G7gOtqDVsTHMxonJD6OirqGpKk+fbfFKFhSm2ve7Zcfa0GGV2OxjLDC2MRK1MQme4lYrapkO1J
 mfpPxw8umwd0TYvR6v7qhyYBU5xhSb1vtj64WGP4hgyhMe7Zia8XSQYxI2pP3kbTBLwCEH5tYN/
 q2TGjG1tk=
X-Google-Smtp-Source: AGHT+IHn2IVXmv4TAs9ZDsM3m5TjILlKpyfLHti3kPC4gHT8ImAv/4pqmwm79OqCdZWxAy1b7wnXmQ==
X-Received: by 2002:a05:6402:13c7:b0:615:979c:e8b2 with SMTP id
 4fb4d7f45d1cf-615979cf015mr4353734a12.29.1753937337505; 
 Wed, 30 Jul 2025 21:48:57 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2b892sm520972a12.25.2025.07.30.21.48.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 21:48:55 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6154655c8aeso710487a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUzimBwz9MGrfj5gv9BML1Oj3VmWStJnMH5uXHce1kFPtY1jxl0lOc83MI7jI0qxOJVWZALT8/ci1c=@lists.freedesktop.org
X-Received: by 2002:a05:6402:42c2:b0:615:8f10:2d4c with SMTP id
 4fb4d7f45d1cf-6158f1032c5mr4612317a12.4.1753937335353; Wed, 30 Jul 2025
 21:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
 <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
 <CAPM=9tyb1mELymOJv62KJom4mGF0UBifbVqLJUFdS1C7Eeu3jg@mail.gmail.com>
 <CAPM=9tzDWmYBKQGB0ybDzhYHkg0p98_6PJA8OuPahRep8+QPvQ@mail.gmail.com>
In-Reply-To: <CAPM=9tzDWmYBKQGB0ybDzhYHkg0p98_6PJA8OuPahRep8+QPvQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 21:48:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=whOb_ebQQbnXeqb8uXf32WA32nrL3=HQ2y8hBm9hFgVOw@mail.gmail.com>
X-Gm-Features: Ac12FXyqfcARQ-zUwGqzZGAbIHJ9CUJpqWHEZ271UfDUtdTjz1kORZjkZIzYe-s
Message-ID: <CAHk-=whOb_ebQQbnXeqb8uXf32WA32nrL3=HQ2y8hBm9hFgVOw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 30 Jul 2025 at 21:36, Dave Airlie <airlied@gmail.com> wrote:
>
> https://lore.kernel.org/dri-devel/20250717204819.731936-1-mustela@erminea.space/
>
> is the only thing I can see that might not be in the merge.

Well, it's one of these:

  3f2b24a1ef35 drm/amd/display: Monitor patch to ignore EDID audio SAB check
  aef3af22a456 drm/amd/display: Add definitions to support DID Type5 descriptors
  d7b618bc41ee drm/amd/display: Refactor DSC cap calculations

Let's do a few more boots to see which.

The sad part is that this machine builds a kernel quickly, but then
takes quite a while to boot, and the failure case requires me to then
reboot again to get to a working state...

But almost there,

            Linus
