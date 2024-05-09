Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F68C1948
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 00:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0719510F751;
	Thu,  9 May 2024 22:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WMINArMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F64410F751
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 22:19:05 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-61be4b986aaso15412397b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 15:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715293144; x=1715897944;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxoYyUPeePDhZr8SB4hDXa4C84ML6RNq5QiUdi5hnpE=;
 b=WMINArMKNNZTYYbHc/+4x6cP5rOL9z0FkIuxOf56IWSfJr6W6ZkclnpVbnm/ScmQmE
 IMuk6f5gxPsFLk5Spg5pCIKdaFGMMuigfQG+wS4Sne6priJtohU9vuM3FJmf3cWxSM0v
 TwyFiCqRj8U5K9O5Yibtq4z/NNkMssVyMylw98TgEfOZSH0QPI3JJqGAyQd1E7WDPQzr
 r4kk2hILmK8H+uGDq/qWxy4np+/otJOC7MThxO/iCRTRuOhe2H0YSQaRx4AE20TXpsv/
 QXYwfNWpfR6EGBepk+sEbkh9FtJ5xSafa7gi3L8zGYsWVvkSnwlDP70NPKhwx5rGS3+J
 DLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715293144; x=1715897944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxoYyUPeePDhZr8SB4hDXa4C84ML6RNq5QiUdi5hnpE=;
 b=w5SU7SEAVrEuSWcom05D5GNkBJpHK+EN4xcBm3X+HJvrujZI0BqVvPnE81NyEa71O2
 iDpEGegQjBlUkyZ/34yatKVl8F9kPpi04Ba7j2Cchr21zZ+dAqnPOTe/QWFEPHV1mJgS
 zrzoSyM2Ou/d1o+qO0sI+F7UVWvmCj5UFoV3ciixVBbixJ55CbOO81jdB2xYmDNFHukX
 L4YrT4wcCdjdbCo/rDusPEHUgzmaYo7BuQKaE8hYGd9Ii5RSvnWW2404fSh48bqVNMQj
 ahbRc/xgYvk7WBtvBw1rK3NXvzrWboH9LWr1UlcN3ItdSH54EDL0MYMpu7u5adTVCbhW
 aWvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEPo3lhujZbnOFI4TOgx5xoR4rPwGuRtod+CGbkEDXj94YWowcmA56hA2MqxZNUbU+ODmz3Rsx9N2F81vuW6wfYcHNdEgjjq5iaY1tNo2+
X-Gm-Message-State: AOJu0YzFle5s713rZOXL4T57rMERH7W5mGd9VqaIQeHvHtCdTq9C3Jgy
 orWOQJSVhtgP1saq97z64WXmAJvWDnbedOOfgiVu4SAT5TOcO0gEzgH6sLdurSFnfVHalXwSNJe
 ajqyKeGojrqJe6oWPrluxhi5SpjRvJOSspJYY
X-Google-Smtp-Source: AGHT+IGe8M/e0bjrvOjdbqypABRID7ZIyZcCukLEAafyMAg6eJo2xT8Ix2AVn9pQmMlZBxx8XY7bDoUSIY4vQAB53w4=
X-Received: by 2002:a81:4c86:0:b0:61a:b3e8:8d94 with SMTP id
 00721157ae682-622afda0980mr9743247b3.0.1715293142655; Thu, 09 May 2024
 15:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
 <20240508181744.7030-1-jose.exposito89@gmail.com>
In-Reply-To: <20240508181744.7030-1-jose.exposito89@gmail.com>
From: Jim Shargo <jshargo@google.com>
Date: Thu, 9 May 2024 18:18:51 -0400
Message-ID: <CACmi3jF6Dp3PE8X=T5kTO2+eYJQi7jWACFdmp9jzKxUtcQphnQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: daniel@ffwll.ch, brpol@chromium.org, corbet@lwn.net, 
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com, hirono@chromium.org, 
 jshargo@chromium.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mairacanal@riseup.net, marius.vlad@collabora.com, mduggan@chromium.org, 
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com, 
 tzimmermann@suse.de
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

Sima--thanks SO MUCH for going through with everything leaving a
detailed review. I am excited to go through your feedback.

It makes me extremely happy to see these patches get people excited.

They've bounced between a few people, and I recently asked to take
them over again from the folks who were most recently looking at them
but haven't since had capacity to revisit them. I'd love to contribute
more but I am currently pretty swamped and I probably couldn't
realistically make too much headway before the middle of June.

Jos=C3=A9--if you've got capacity and interest, I'd love to see this work
get in! Thanks!! Please let me know your timeline and if you want to
split anything up or have any questions, I'd love to help if possible.
But most important to me is seeing the community benefit from the
feature.

And (in case it got lost in the shuffle of all these patches) the IGT
tests really make it much easier to develop this thing. Marius has
posted the most recent patches:
https://lore.kernel.org/igt-dev/?q=3Dconfigfs

Thanks!
-- Jim



On Wed, May 8, 2024 at 2:17=E2=80=AFPM Jos=C3=A9 Exp=C3=B3sito <jose.exposi=
to89@gmail.com> wrote:
>
> Hi everyone,
>
> I wasn't aware of these patches, but I'm really glad they are getting
> some attention, thanks a lot for your review Sima.
>
> Given that it's been a while since the patches were emailed, I'm not
> sure if the original authors of the patches could implement your
> comments. If not, I can work on it. Please let me know.
>
> I'm working on a Mutter feature that'd greatly benefit from this uapi
> and I'm sure other compositors would find it useful.
>
> I'll start working on a new version in a few days if nobody else is
> already working on it.
>
> Best wishes,
> Jos=C3=A9 Exp=C3=B3sito
