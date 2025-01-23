Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD90A1A90A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 18:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BB710E2B0;
	Thu, 23 Jan 2025 17:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Q1MJTlQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFAF10E2B0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 17:40:01 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so1291623e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 09:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737653999; x=1738258799;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X9uWv1CZXW+AYt3piL5X/2kw/MCLHhdqmnPyWe9WfC4=;
 b=Q1MJTlQwP4krrmf3HXTcAJVToXbqbwt96gXdZ680Msm5d8vJSzmU6GeS6HYVR0RFIh
 zagEGY+0tourHExcyTtnYpd9jdWX9EZ63BlqiRY+3sYr0fU7QMFIJ5rBkfSnOdzroMZQ
 FRdTJhIR4JR4p+Qbc/lUGgnL6f+mnvExSex4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737653999; x=1738258799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X9uWv1CZXW+AYt3piL5X/2kw/MCLHhdqmnPyWe9WfC4=;
 b=rTWi8VgqMNlMc9dBqB/irSi/RKtRMkE4WjnOq74XaTuhKjeUqq177TIWXUdnJ24YTC
 56FaOpK2ZCS325gwa+SWJiamsYNg6urT9swbgx359W0xtrWuQOxbiUuLt+7LTIXDHlcm
 OGczCgIaxhiL/jnhkKYgSaygctH1k5KabHgyG+kXWT46HIRxDm9PTZNUd8gTXOSl6pxZ
 l7oXToaCR7+muh8a98PkbnBxkeHmLTb9x2buTzNCHicqSF3hqRns3zeTuVHcc/IRQbBr
 09Vp8zmedn7/te57mH/Fg2sY+zzyK7CtKvC2iydmVDj8yI3cL9wmj8QqmL2y4m8oAUP4
 BTUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMbly5tXThNHQmwaqY56wDYvTgJsM5NzjEuVV3q98ItDi4tpmc07WQ4/e7guGc9gXjhy/xA8t0Epc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz6KvIP0Uasx6xpKGJUKyBGIh3jDIMGzc1VJ7Daowt8eXm4mMS
 jOOLF5tD0B0Ssw+llquQ/GV592H/fnHB8UUh9LhKY5aWRp4KwrV06dAQ2xbNUXV5F4ddoADIx+X
 pPTk9
X-Gm-Gg: ASbGncu37fm59rmokxvNwV0tQb6qB2YifE0ed9rlpFI0hhT++DCbA2FlsYRBm3mXt5i
 TirNwGPGV+zT+olVuGa0Antf/pfIzczy+VPVxNl00eYKiH/89dNiMkOyYPRdD42/L4gGBP9X7sl
 duSVuwE335SdruO5icpYOSa8lDqvJSnv1O9lIOdxpDB73YJ9Bk1iSXJBIea9bhBH2f/CS03/zkB
 RrieyMjUkndTnps+V2L7uYCFKwi10/QeA3IrqW3vISvXDxZdRXimCSuNlOX+j+5w7on0EbH8lBo
 GnOAvEYRIf6IiFhqIXu3NcDg67cilPdb9X6IO+HSSmde
X-Google-Smtp-Source: AGHT+IGYbBAopmVLNFRrYkbDxrTa13c+3g7BdTuWE0oHcFdM4ZdtDHFiUjKjbaxvleS/Z4FzwoezDg==
X-Received: by 2002:ac2:4424:0:b0:540:1f2f:6ac8 with SMTP id
 2adb3069b0e04-5439c282100mr8976638e87.33.1737653999388; 
 Thu, 23 Jan 2025 09:39:59 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af76f1csm2714374e87.211.2025.01.23.09.39.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 09:39:58 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-540218726d5so1348622e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 09:39:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/0j82a39+latupOSowI8FbRzMoE6rN7cLTqWT+A4Z3AaL6f+FLcMT2NfcxrBV2A/Fp45IxTWZQYA=@lists.freedesktop.org
X-Received: by 2002:ac2:4c24:0:b0:542:6507:9778 with SMTP id
 2adb3069b0e04-5439c22cb95mr7130113e87.11.1737653998113; Thu, 23 Jan 2025
 09:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20250123064758.743798-1-yelangyan@huaqin.corp-partner.google.com>
 <20250123064758.743798-2-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250123064758.743798-2-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Jan 2025 09:39:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vr5DnACFoQnnFzPhF778Nv6LOZj43BqZX6vW_azMARZQ@mail.gmail.com>
X-Gm-Features: AbW1kvaJA_nHTtfVUNc2cj9PmkZzMWXaKlErRqAlrUOWVEWHGuH3pCltIcw2e98
Message-ID: <CAD=FV=Vr5DnACFoQnnFzPhF778Nv6LOZj43BqZX6vW_azMARZQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: panel: Add compatible for
 KD110N11-51IE and 2082109QFH040022-50E
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

Hi,

On Wed, Jan 22, 2025 at 10:48=E2=80=AFPM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> KINGDISPLAY KD110N11-51IE and STARRY 2082109QFH040022-50E are
> 10.95-inch WUXGA TFT LCD panels, which fits in nicely with the
> existing panel-boe-tv101wum-nl6 driver. Hence, we add a new
> compatible with panel specific config.

FWIW, this is still missing acting on a request that Krzysztof made.
Specifically, instead of the above wordy patch description, he
suggested a much simpler patch description that was just one sentence.
I could believe his suggestion may be difficult to understand if your
English isn't strong. He said [1]:

> "Add a new compatible for foo bar panel ....". One sentence. Could be
> also one patch, not two patches

Putting that more concretely, you'd want to change your patch
description in this case to:

Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
STARRY 2082109QFH040022-50E.

...and that's it.

Personally I wouldn't send a V5 just for this, but if Krzysztof
requests it strongly then I wouldn't object.

That all being said, the part of the CL description that Krzysztof
wants you to trim is actually somewhat relevant to me if I am to give
a Reviewed-By tag. The agreement from DRM folks seemed to be that we
don't want to jam all MIPI panels into one bindings file and one
driver. The idea is that they should be organized by the controller
chip. For some history here, see [2] and all of the discussion in
response to a previous patch [3].

So the question is: do the new panels you're adding actually share the
same onboard MIPI controller as the other ones in this file? If not
then you _do_ need to spin your patch. If there's already some other
bindings file / driver for the MIPI controller in these panels then
you can add to that. If not then you'd need to add a new bindings file
and a new driver.

[1] https://lore.kernel.org/r/9cf4efd5-cc4b-492c-a1f3-18a19ba7afeb@kernel.o=
rg
[2] https://patchwork.freedesktop.org/patch/msgid/20240516072039.1287065-3-=
yangcong5@huaqin.corp-partner.google.com
[3] https://lore.kernel.org/all/20240410071439.2152588-1-yangcong5@huaqin.c=
orp-partner.google.com/
