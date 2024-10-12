Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFFD99AFC6
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 02:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81BF10E088;
	Sat, 12 Oct 2024 00:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Heb7IHeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E1510E088
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 00:53:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a9950d27234so368810266b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 17:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728694388; x=1729299188;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fX8qbIl6yI0pe7Z7Ey3xMlNXl8QKMUUNG2vGHvdrAqQ=;
 b=Heb7IHeXN/rfVdccHxjO+DR9DQVWXgBO/SpJghJLV9obQsUsoJV5hiIXxIrMkdY6Zz
 mewaFhOT0OEZ7Wk0HmvQdsMiUZIOW7KeFUAS9tYCclTMigVUV5OjjGOzCurYaQzVL3lc
 5IJKiQN0DFxRl2FfjUnFHC6udS/bQJDfASEiqBV7SPkqhOhfoiA4yQpzsDJDFPlbDg7a
 mfwFw3WHEfqRmY9UqUhxI4Kv0+ymeevRJHBzbLq/6Q5RKDVCa8rxd3UDOS5Zc4c1Tvxi
 JXErXa8hQWVUiEOdQ0U2KUDa2vlQSOBITz3MKruCvrUd/jrQ04eT6KBOXMF7A3zU9G2m
 14Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728694388; x=1729299188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fX8qbIl6yI0pe7Z7Ey3xMlNXl8QKMUUNG2vGHvdrAqQ=;
 b=g6lWHnAZD4fPfKoaIknQ5zGQWFHigAHc3YJ+s0PqxVf4Fud2qfRIg9nczU7zSH1iz4
 3DePlsajpJWgbZdBdB4nzqA5zCu8+ZCKSy5MOo/3ZvG+G0OiwYwD5jDLa+mWEkV8EzpR
 9DeDS164RSAnlO4rwsBspjiiRp+kvx+ej8gkh76gFuO2Ox1Yb/wrCtorJsSuxeDDg1qq
 P0+BvDiwl9JZ6QDBiMafSGvlyRp11KFK37tnskcUHqEbVkHExLYOOKSQpuOnV31xjqAI
 pvfdrVXlaZT8jZhTxeWyyr1c39thnmptGWBAKagQfgyb1bqvDN8ApR/S9RqQwh2pOV4j
 GtzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd+RgKn2foNam4FEeHVsysHZCztIxbgOgm+gYu5t+DbrWhrRKWDOFjH2LZAk/yHThr3DD/HK9yx3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmjTaHIrpj81gxxtjaW+L+Rrk8gNRxO3Pd4ngk6K4WVoGdeIBt
 bNBkIVNrTJb5x6jt724C34WPvnPmGJ82Cy2CcqOXI9mIiZWEVB8jIuTUJrU9G/DzmCtFzTamk9Y
 GEpGkKSbt+E3swzmOSJIzoiUjiRVALvHAX4o=
X-Google-Smtp-Source: AGHT+IHcGOMyjbUnqPtl1UM87h3YL87dZ2gYOIUO6wGlw/CCJ1mjQPIwZZ9PoqGjsv+QiY4iVj7yxWbnA0AL382mrFA=
X-Received: by 2002:a17:907:ea3:b0:a99:4e8c:e5c9 with SMTP id
 a640c23a62f3a-a99b937b7famr358020366b.20.1728694388307; Fri, 11 Oct 2024
 17:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241005180955.6523-1-quic_pintu@quicinc.com>
In-Reply-To: <20241005180955.6523-1-quic_pintu@quicinc.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 11 Oct 2024 17:52:56 -0700
Message-ID: <CANDhNCpeJFn9NMQYwWT04x=HL2bUi71V6YpQG7Gg5PVVCbRfXw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: fix S_IRUGO to 0444, block comments,
 func declaration
To: Pintu Kumar <quic_pintu@quicinc.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, joe@perches.com, 
 skhan@linuxfoundation.org, pintu.ping@gmail.com
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

On Sat, Oct 5, 2024 at 11:10=E2=80=AFAM Pintu Kumar <quic_pintu@quicinc.com=
> wrote:
>
> These warnings/errors are reported by checkpatch.
> Fix them with minor changes to make it clean.
> No other functional changes.
>
> WARNING: Block comments use * on subsequent lines
> +       /* only support discovering the end of the buffer,
> +          but also allow SEEK_SET to maintain the idiomatic
>
> WARNING: Block comments use a trailing */ on a separate line
> +          SEEK_END(0), SEEK_CUR(0) pattern */
>
> WARNING: Block comments use a trailing */ on a separate line
> +        * before passing the sgt back to the exporter. */
>
> ERROR: "foo * bar" should be "foo *bar"
> +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach=
,
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using=
 octal permissions '0444'.
> +       d =3D debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir=
,
>
> total: 1 errors, 4 warnings, 1746 lines checked
>
> Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>

Looks ok to me. Thanks for sending these cleanups!
Acked-by: John Stultz <jstultz@google.com>
