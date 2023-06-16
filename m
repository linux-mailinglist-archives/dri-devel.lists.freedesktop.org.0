Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CF57330DE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A870F10E605;
	Fri, 16 Jun 2023 12:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F273310E605
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:10:43 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-570002c9b38so7353187b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686917442; x=1689509442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpQQFpO58kYk+DKa3XvxhM6ckF8WegodESDAzVxBDlc=;
 b=t3U/qFKR309AP9cYsmkirfMJkKZa8eYT/s1I14yet8Jd1d+4/TGyq16uG+pgEXS1GC
 9qHvhzP8McijGS9Lya3dOzGcb2YkrUhHzpvzszgsDvClz87aUHEdLTJmHTbpZLTIbUDz
 HLUCUY6k/pcIxdwxZKsEAiXCpKYoJz62NHTskJJw5+WxJTqGqScPstANEGlff7kZgUOk
 BfxtAQNaG93Z5u40K+hmIbvQhGqM7ohD5HQo+sUD0QE+5Uy5FC53DljGagHzCkwc7j7Z
 /pSRv5FtM9mhGGHEeFj32Jse0Dze5LHzwbAn4U272wYe9xSMppc6l00NJRR1imq2BEf2
 Vdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686917442; x=1689509442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZpQQFpO58kYk+DKa3XvxhM6ckF8WegodESDAzVxBDlc=;
 b=evGThLrc1fAK2t79syimS4SiQ6XMnUKHyuIlvwSzW9bMnlCZm6szFlk7Vggof0H1g3
 wmvinQxopYr2OWTp42HLZC0pJSD0bkDmb8DwYBVmSZB8pSt4LzGILnlJKXQh7+jFRWh/
 yOZKKFo6Yz0U99EE8IhUjLwsEIrxz6+LVfwz847AjZTsx/nhvsXbCdaNs4lW5mQxcb6u
 B4VGTZFrCceb5r4uu39ZXu+bCBQLdGwKMwb9Hqzy0weknY6205GtP0GsMcwLOCxQen1g
 /9KnsW/5Vhv+sfeRnTivtNd4YqgUw2AijNEyxTJh6I7C3AiADpD/eNc5PQTCKtYfkbFA
 PTCg==
X-Gm-Message-State: AC+VfDzwbpzb++WUxDUjlfz9QDchRJLn6juKJSIl5EgZQRqbwkb5kd6H
 313N+V2WlsVQPJvsUbJj+7ysmGI9XlmX9h+BwYWLfw==
X-Google-Smtp-Source: ACHHUZ7oQzkDCplf4pJw8pdwB4NTYSD6c3bSQqv2wja/uj5qMpzxWkSZhE6eIalnILn5u56mZb1SbCNA1rxAh+wZu1k=
X-Received: by 2002:a25:694b:0:b0:bce:a0c2:2adf with SMTP id
 e72-20020a25694b000000b00bcea0c22adfmr1609599ybc.51.1686917442564; Fri, 16
 Jun 2023 05:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-2-sarah.walker@imgtec.com>
In-Reply-To: <20230613144800.52657-2-sarah.walker@imgtec.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 14:10:31 +0200
Message-ID: <CACRpkdZV1d29qCkS=RFQAAeGckz=kp56mKauBW8grqaXGX2o6g@mail.gmail.com>
Subject: Re: [PATCH v3 01/17] sizes.h: Add entries between 32G and 64T
To: Sarah Walker <sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Matt Coster <matt.coster@imgtec.com>,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, sumit.semwal@linaro.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 5:20=E2=80=AFPM Sarah Walker <sarah.walker@imgtec.c=
om> wrote:

> From: Matt Coster <matt.coster@imgtec.com>
>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>

Looks useful.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
