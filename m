Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2B6C2C7FB
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 15:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE1A10E151;
	Mon,  3 Nov 2025 14:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EEF10E151
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 14:56:32 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-376466f1280so57014571fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 06:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762181788; x=1762786588;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s5HhCqdsQfAH71nlBy5jT8rmemhezTVFDs0Da9TumsU=;
 b=TNOa4N3aXA3HU2cAqTKmrRtiCLIKajhReeFjHYdpKHOkFOOReWjdEbWYDLnR51r0g6
 KsRI0E3uOc7HBzpMvhvpkhhYum75sbWxk0LyQt5KI6OLUq+mY2JpcQfhVxVUAvzbMm1P
 haynwSBDnzr0lWDJcRA17ktAMEnsNiNuUGmg7je7hi1L1fT0ieevQSgYK/B8zuP+s1RD
 J9xkFFSZWCLeVEXsbCXjH8kEpQW4IJXha82zhZG6F9mZHOa+g8v2c+z3rdV2LpjH90Uu
 LnxcNd7gOsJFyE/rDTXTUnXt7jgpmghN/ICu8+jDPUyeVkyc1BSY4FX3nfcDZcYX++Dw
 g6Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaIFxOJcXISArybV+1RfZjdi4bpS+SIBlZyiOkpMLPQaOY9CxJP3SOYvvBkFkpTPRBlEfSe1uYEzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylmJO/cnW5mfC+g2NZiZ+uvCfZCYT7ZIQsROlw7IYo7omMabrW
 +QMrpn7gQDdPicVgH3WNEeuwx02wFw3hyBmO5vsCi/3bivXXYqC6zHMkwRdxqZDb
X-Gm-Gg: ASbGncua9v0yCk++sX3Cy+lUvPW9Fk0eD5lKjxqTC1KMMrFWn8mNK100CQkNIk73wi7
 wUQDQIMFzfWueQxPcw+1T7rVKRt15UsNcsdzoPd0nL0wfjIqugUd63/lv5gltCWJExE4X7MDHiV
 wPw98G9Njujt+S/XnGSqEDOmKGKnYqMeJ1GM5Uxi09u3DHmMcG8cckvIoKKRxBI01Jfy32AGhIp
 M3MRdfQiUzJNurtGZr3FgAqthCTqcNK/UZ5qGSooouGr0ZYxhGJ+P2WxMGeSvSs6oOnbpCKYFGw
 QxUbDg9XOJz+B+B5Zv3GUAHz7ZmVami+WtWjExTcH/dC5rxlc+eefezpgz6m0NczzzRpGOR8Wi0
 fodH+1L38IgWRsXnruk44QWpYoXEmLaO3mCCIuwv+1NCMlCVE+geZQmwyhZA06xAlAYUg2jGFV2
 /P0Q6N7vOBcYkmMXdAiRSTosXVbsmFmNbXFlCzZbZg/IOehENzlpVxMw==
X-Google-Smtp-Source: AGHT+IEXQvagTNv0zYFCjZa1VPyLujqfT/WMJxB8aSBoJI4H6N2BefG0y5tLr0pD4+svAlJ2Gu3Bug==
X-Received: by 2002:a2e:bc19:0:b0:372:8ccc:2629 with SMTP id
 38308e7fff4ca-37a18dd3319mr39906031fa.34.1762181787919; 
 Mon, 03 Nov 2025 06:56:27 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37a415e5962sm835081fa.36.2025.11.03.06.56.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 06:56:27 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-376466f1280so57013371fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 06:56:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUbQXFudUuSHQ0pkML8oykm/gQX0PvH3iSHZ3UwqqPx7TobH/PW3Sn2w5z/O4rYZF8tIsPveu4nzoA=@lists.freedesktop.org
X-Received: by 2002:a2e:8317:0:b0:375:fa47:14a8 with SMTP id
 38308e7fff4ca-37a18dc644fmr33438281fa.31.1762181787126; Mon, 03 Nov 2025
 06:56:27 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-22-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-22-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 3 Nov 2025 22:56:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Sfk7WvEXNnRfKRehtyn-4KhPBER9tV0E2_pX4JxGC8g@mail.gmail.com>
X-Gm-Features: AWmQ_bmDRSdirXrFZY61Rit-O4eYxqlNFv0KMpQajaon1izsKkp3c6YIV8hGfRk
Message-ID: <CAGb2v64Sfk7WvEXNnRfKRehtyn-4KhPBER9tV0E2_pX4JxGC8g@mail.gmail.com>
Subject: Re: [PATCH 21/30] drm/sun4i: csc: use layer arg instead of mixer
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Layer will be more universal, due to DE33 support.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
