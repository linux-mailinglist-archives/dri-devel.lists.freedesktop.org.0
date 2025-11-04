Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A4CC30218
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 10:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7147910E56E;
	Tue,  4 Nov 2025 09:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575C510E56E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 09:02:11 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-5563c36f6d4so5087563e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 01:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762246930; x=1762851730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H67jLGC2+nP+gJvVX0MRHo5Sws7Lcd+OKCPJPF9TIMI=;
 b=O7AoaVsx6VAs85B1cyuQlJrJ7OdQ8E7R2lduaID0G/3ncQ8W3xIyG0RFqE41sigxlx
 xvzWPmher7P31S8qqNQ43Wpaf1sKrmY/rLHi8ULn0TcHHRFfdfjHRRegLiObb9t4vESN
 /QfLjGNy/Mtxsf73CkOidAfFOnpaVEQQ2wVZ1tnHTrOizRFIhOe4X5oXufgc5vXNeAAG
 1JhrhylMiFseQWLQRWwFB0JSM0j0Yq+5CI/CCiFO9Yq9puBq1fKAdgxO21vWrhy5OeuJ
 YeBVVFwOJWB3ERidLJh6/uf7YG+s/Y4IAre8AMo9DJ7bBhRplLpqAh35rFXg2GX/ri5P
 aj3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7UBsWkoUYr2BlHw80iel41Yz7j2lQM/VxvPXQHFf69fVHxN6ggQzpVN3e9W925k9nwe1MxIFxvCY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzevPSPBLqihpAUX+9mt9vMN4YdqbuGQ3lH8HFxTG4liSpeC42R
 HZdaByuh/qabfkwQN/jCadNdpTpgqqgxDx0yYfKa7tDbRiSsqhf7+jcfJjoDsVZ/
X-Gm-Gg: ASbGnct5bdWk/xmJa6OB647QeTOJwue0wSOQj6kl8M+4tLHfiDz4qltvhGZKb8U4u0Z
 X97IawgdL/i7CMz9t2BpzzoBDqIcnPsbkRqi9/TlXMINdKJIpH5MLob/oJ40yq+W7woLlavgFr1
 EvNXWw5kzUbGprLQpkWhoLKSgu6gdoib4RTFQM/9EWEaEB6gkcjKgR76aHAPCGLCog+PF+5wKM7
 BjyHTMYMXxyhpmY3rH8OyDlGs9dBaXtJxkyNv7lJCKbeMp4jIomKp2RGXIholgd3PIjwiSIV85X
 R5Eg/o8117CAvz5sm07XJ9wG7l0oa3oOhJy27KBnFdS79pZDoLkItBEjXr14u+mgCrHZBnBIywt
 wHATTYXF00Mzowd66c1XlpHfQJL9jX06PP67+FTDAQSy9442K5xoixR27/ULgVKj3O5pMM2OfJw
 qBbTx/+uYfrJIfRBwl7XJ9QECephP6D2PESNGi89cYBS9pWpgp
X-Google-Smtp-Source: AGHT+IF7boyqtD47bFITX4LHIMdk6bHSi+ZyTZ+qRbztfKNB1OoyZEd7acVkuh/lWIXE3hx0qrxt8Q==
X-Received: by 2002:a05:6122:30a9:b0:557:c734:ee5 with SMTP id
 71dfb90a1353d-5597731dba2mr825640e0c.8.1762246930061; 
 Tue, 04 Nov 2025 01:02:10 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55973c834f1sm836064e0c.12.2025.11.04.01.02.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 01:02:08 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-8eafd5a7a23so3755989241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 01:02:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHd9u0DBoYrtkBtV5KEwrEfJgRzOoLjiShA9IknH9W73wbChtGWweNQZ4wF1KoJSStxtvEBofqaYY=@lists.freedesktop.org
X-Received: by 2002:a05:6102:442c:b0:5b8:e08f:eb38 with SMTP id
 ada2fe7eead31-5dbf7d63c3bmr753205137.14.1762246928045; Tue, 04 Nov 2025
 01:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 10:01:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoVrMCcN0yY6BNrgXxFFPP-uJSAssZVrSWBSPtTr9DwQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnnwTsbga4_ceAKrw3IqMNP5c9B4ptZmLIuqnx7fLogJkKsw0-FT6vmR8I
Message-ID: <CAMuHMdUoVrMCcN0yY6BNrgXxFFPP-uJSAssZVrSWBSPtTr9DwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

On Mon, 3 Nov 2025 at 21:08, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
