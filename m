Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C9552D0D1
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 12:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9598D11A16A;
	Thu, 19 May 2022 10:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E930211A16A;
 Thu, 19 May 2022 10:51:02 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id u35so4476171qtc.13;
 Thu, 19 May 2022 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c4O1oOgQR4Kv4FhhMi078PAReDESxrGJjsVloSpbOSE=;
 b=McyIfy7gPmUGAPdX/GL8f9xuCPAEwIBxzOf8A/NJLF1rYzRi7QWDdyO0Q0tGejwJSX
 mLcoA/YxcgxMUxBIQRRBXhCIQe9GIa4aoaOMjf77jbNb7lWGVskzyH8K5wIXDFiOswGA
 azBxBS1NUOav8chzpbcp2Vf/ko+umXUx2F04eWeGKOnYElhVlSuJdCgpNtILlXZF+I20
 aHD/l76m89c3PHdV9pdvmi1PMsroHVmWw0aoWiFK3B2QiR1GXYmD0YKRteEbOB8ULE72
 7E0BRmf3wabOX2ALCvp7uNtiJokqzPR0axQaH/BOYNO3J3EOLLilnZ5LyrGL9P2GzL4j
 U9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c4O1oOgQR4Kv4FhhMi078PAReDESxrGJjsVloSpbOSE=;
 b=PTbj7tpWS2CDs49TPSO4yrgviCqUYQCaK4+bGaCriPGwGT60i6PbGFhm0G/+hhV9VO
 I9crq069F+C/drIPqtoVccmsgR4z50ADY3Bqn5tUnVXI+GXOVZW+JEQdbtZRkLSTsOtT
 Bfj+bf2PVCEnrHczc0Ss1EidAbcOamXhfJ10HYZuFzq+FBNRG0xHC1vmjziahCler8W8
 vi6g9qnYcyQ1r8wAZ5SXQeILnPSL/qypMkU0AgqwC4IyKt5baClOYBW822jLlaaXYmXt
 A2dWWuMD9LSR1iOv5xhNVg9VveHLm7ttDpw6Efspd5E06T5WNV8xRiQSPCihlVp0GNSa
 UH2g==
X-Gm-Message-State: AOAM530PD1uFJdan1pTchuu3RiOSYL0PdH0JWMCz802tBwPJ5pkxUauE
 6uZ0nuQT3XIv3eadTPOCRk1kWMcoootId/i2C54=
X-Google-Smtp-Source: ABdhPJyZmv6hTUj3vsWvJRXN81mWJ2JIzYVv1kTw0R63LyRTGWwLQfKgQR040nIsScGnT1KE1wOc90x1/3e2j76X/8I=
X-Received: by 2002:a05:622a:1a20:b0:2f7:3b31:7cba with SMTP id
 f32-20020a05622a1a2000b002f73b317cbamr3288671qtb.689.1652957461795; Thu, 19
 May 2022 03:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220519095508.115203-1-christian.koenig@amd.com>
In-Reply-To: <20220519095508.115203-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 19 May 2022 11:50:35 +0100
Message-ID: <CAM0jSHOP=vyuiWOaWqo5k3G+KbAEB2HhCZKgA1VScqZknZPEyg@mail.gmail.com>
Subject: Re:
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 May 2022 at 10:55, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Just sending that out once more to intel-gfx to let the CI systems take
> a look.

If all went well it should normally appear at [1][2], if CI was able
to pick up the series.

Since it's not currently there, I assume it's temporarily stuck in the
moderation queue, assuming you are not subscribed to intel-gfx ml? If
so, perhaps consider subscribing at [3] and then disable receiving any
mail from the ml, so you get full use of CI without getting spammed.

[1] https://intel-gfx-ci.01.org/queue/index.html
[2] https://patchwork.freedesktop.org/project/intel-gfx/series/
[3] https://lists.freedesktop.org/mailman/listinfo/intel-gfx

>
> No functional change compared to the last version.
>
> Christian.
>
>
