Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7BA0B591
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 12:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B1210E290;
	Mon, 13 Jan 2025 11:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="K2j9h33J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D58710E290
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 11:27:10 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-518a52c8b5aso1330561e0c.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 03:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736767569; x=1737372369;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3hahkWocHwmmkAO+vdyrc0iLuCr5couR8jZqwcdfd0=;
 b=K2j9h33JVJNqGjRsHjfhoNvpApa3kar0hC9vGHQU6cVhX5EUm0F6rnJgSkj7rKzPMN
 U9POrVEp6fp1svxPE4fMcdSowM9+9xUFmQDgZQnf1u13UILiFdRB8mmudOklOGykujRX
 0AoOoNCc2TRFVivG0Smg0nwKDxISQFMEpToto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736767569; x=1737372369;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3hahkWocHwmmkAO+vdyrc0iLuCr5couR8jZqwcdfd0=;
 b=hbla8LpuiSongSacG3zFT0lzC1Wf8FOaVoSZJIXjeuomtBHOkeAilSyS1sI6IoeFOU
 TvY1a/RyzINrR36bG3y9iWAproTDGuFCySiUQURUf2sbBUayZdP6vWz0zSipurIPxoDm
 2IkjAbkigwU6sogWt3q+VmsPcIcXTmJE8jsHKuIMJW9vzUG+OiNt/f7GNelkdIY0spBP
 E81O1UilnxuRf4bA/ua2VKBU3Hw6ZKWPFahdlbEnjUo9nXQq60KsYiKWUFSdSVMC435V
 V6K853KUPVgTQuo0m5xDFlQR4wThYk6MyHg+smn81P2wifykzzAaDON4Vki+NOGN1Qx0
 P7Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+dheY6rtA4/LlNNN6kkED502L+5ijfxYQMzNLimhiYbwkxzazaQjJac9JRpzDvfVQclhesdJr6v4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNuo8c/UgJcEVznzKiNPm2aqyyTjDjklOx6vO72wYM7sN29809
 py1Ea+xeSR5aqHqA6fpgsI57TkWxE1rcNje//9+eOOk/ZlpwZE0J4uA1xXFsIrWOymWAwdYYjI4
 =
X-Gm-Gg: ASbGncswE6ihY3lSfXgRzD0SoAYQ9P/6H95E7mnR3NiAhwIUJVHE0hUdOK98UcWcaUp
 A9hLokiwkzGIiVZ1ooV8IfI6aUvCY/8MsVAzhcwvoBGoziwZTkNIQPH+lUUuK1z278n6k+312sN
 +7thgCcJG2UcL13yse2e3MoigpcuDEzehB1B09zZbKNaHqv9Qh+v+sa0sJc6JfUXLlP6QMQfLP5
 i9nsySil6RwR/d2n1LiVv5naQWNpU4JfJvKWgePMtse2KuKdTGEYFyV7oSi3anedPeYGWF1gBoo
 m42Ef/IeblNa9sr+
X-Google-Smtp-Source: AGHT+IHQ+j6Z2GljWCGYshlNJYs64TzzCnE8uUT4g8SmYNAtA44Yv7xDKkpgEAPuREZ07Wr0TEGfqw==
X-Received: by 2002:a05:6122:50b:b0:50c:9834:57b3 with SMTP id
 71dfb90a1353d-51c6c46b338mr17021091e0c.4.1736767569431; 
 Mon, 13 Jan 2025 03:26:09 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-51c7fbfde05sm3496770e0c.25.2025.01.13.03.26.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 03:26:08 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-4aff31b77e8so1666859137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 03:26:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXNYfYbmSYNa/uHlYlJOO8tOgrwm1XT4on+lCqQTJLsm4Cl5ycf3SKdWRTvVegiKJpT/2WMP+9hDsk=@lists.freedesktop.org
X-Received: by 2002:a05:6102:26d6:b0:4a3:ab95:9637 with SMTP id
 ada2fe7eead31-4b3d0f1a897mr14365630137.12.1736767568272; Mon, 13 Jan 2025
 03:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-2-paul-pl.chen@mediatek.com>
 <0499ee04-0fcc-42e1-aab8-3cb8daa88c88@kernel.org>
In-Reply-To: <0499ee04-0fcc-42e1-aab8-3cb8daa88c88@kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 13 Jan 2025 19:25:32 +0800
X-Gmail-Original-Message-ID: <CAC=S1nionnQ=g-7Ys=D_iQegPebuPfOH5S9aOx73aVh987DMLA@mail.gmail.com>
X-Gm-Features: AbW1kvai0eVMYu31zp3zyb5u2A5YMsTuoKfeRhXsuHOuCIeklBH2XCKHTQA_efQ
Message-ID: <CAC=S1nionnQ=g-7Ys=D_iQegPebuPfOH5S9aOx73aVh987DMLA@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: arm: mediatek: mmsys: add compatible
 for MT8196
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "paul-pl.chen" <paul-pl.chen@mediatek.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org, 
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com, xiandong.wang@mediatek.com, 
 sirius.wang@mediatek.com, sunny.shen@mediatek.com, treapking@chromium.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

On Fri, Jan 10, 2025 at 8:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/01/2025 13:33, paul-pl.chen wrote:
> > From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> >
> > Add compatible for mmsys yaml of MT8196
> >
> > Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
>
>
> This is a wide pattern now in Mediatek: login name is used as family
> name. Repeating the same comment to every Mediatek employee is a bit
> tedious, so maybe you could fix it internally?
>
> Create some guideline for your colleagues so you won't repeat the same
> things over and over?

Not a guarantee that this will go away once and for all, but I can
ping some MediaTek folks via a separate channel, and hopefully they
can amplify this message internally.

Regards,
Fei

>
> Best regards,
> Krzysztof
