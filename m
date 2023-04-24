Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC046EC795
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 10:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442B110E049;
	Mon, 24 Apr 2023 08:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C97D10E049
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 08:05:28 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-54fc1824f0bso45824837b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682323527; x=1684915527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zympgsGXJK0H9fEUC44Mmed4PGvFG4LKfOOmAOBmWVo=;
 b=CFlwITicOUd0drvtoXImi5P+ObED/43JuW+GrEUK00FM+z4l/1sBXlBfgGpFk3fLeG
 8P5m4kpQGtf4Jb7yFj82Wg4l5wpswsZcim6oZZ8EhEpPoSlgR+4JRuz8vmN+CMv4U6sJ
 b9yt1f7s/4scSNHof3THudtGnWLPtSIGecYcF2q+Xku5aPXoLTeN/cf7N0+2ahk+22yy
 YhbuwXzZekIP31wG2XalUfLKMzZiYZaARl8c0z3ZsdYe4ZHR1Os6oYnlgyRmdqNwC/8/
 GL3PaVO71lAGWQ+Vgoh/Y+yEX34fPH1f7q+Lr7zLkcvBpGJeta3Aoh1qK88wrgklxkmO
 /ghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682323527; x=1684915527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zympgsGXJK0H9fEUC44Mmed4PGvFG4LKfOOmAOBmWVo=;
 b=UIk4quG87eTfEhVepzEAo1MIa+YKqhfuW20wuuR02etxn0U14HCHFpJUJvqTClZBjv
 xxhVl9BCpHdASRx7Z6X+pGPqk4ygvTVzYi7iY1s+lZqdKW+SFrMqUKYxxRrHfmH2scZP
 zKDAP2KDHuLOl63MMhjHE02D1sM1LI1PmV2KGPbsjZyyJ9JZRUR5Tj2L43zUikpee0PI
 IJOu1+xp+/Yo4B9ts3nTr0gWfJrVr1DgPqTncwUxUXYf1e1AVORBqkEvrqyuHx79BGpS
 dmSeJobray82HxSFyeNGDDZbttcQBzn6fVS34tdE1h9RvavikNZCwnK3RTjmsbhRme9S
 Kisw==
X-Gm-Message-State: AAQBX9cVfbR3R3CEXHKVjgmedOUOTlMNNub8cYCzInEeKsKhculpebQR
 ubp1+R0gVJecmKqvd0Q/ji7CDa5UXCSEEgOv5GuSOw==
X-Google-Smtp-Source: AKy350bU3+GRCXOx27f4Xrkltn2TroIypMC/iX0pWtnmX0xp3c9/RsMrEKbvhWeDFm0i6n0B2GZoVlwl9D+D7MfgV78=
X-Received: by 2002:a81:61c4:0:b0:555:cbdc:c6 with SMTP id
 v187-20020a8161c4000000b00555cbdc00c6mr8250272ywb.9.1682323527184; 
 Mon, 24 Apr 2023 01:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230421091319.79744-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230421091319.79744-1-yang.lee@linux.alibaba.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2023 10:05:16 +0200
Message-ID: <CACRpkdaKHkwpdUvYq+usSOmQ8q=WTyMpFLEswpHRaW6qryYVxQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/tve200: Use devm_platform_ioremap_resource()
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 11:13=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.co=
m> wrote:

> Convert platform_get_resource(),devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource(), as this is exactly what this
> function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

That's a nice optimization.
Patch applied!

Yours,
Linus Walleij
