Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40FC1F123
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4252C10E928;
	Thu, 30 Oct 2025 08:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="LlDWmXuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A98810E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:37:18 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-592f5736693so817223e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761813436; x=1762418236; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0H69JoG/2rJHvdEOAXH5NLL2iNrX6QKlodTNw1vRLt4=;
 b=LlDWmXuGxIjce3FrxdvZ1EwwLXGDjCI/TpnG9Lbt7Lk8BTpdkNUZwaeCjN2M6CbsdD
 wgM/i076OUqI6lsy3p66hPo7PUdh6T/5WAdJFIjpPtUQOsdvaiuQZeKX4oOaYPk0Hrzz
 A+itcpwG1hk+9U/7Sx4GZMOGWHtK/WY1xTwvAQTP8Xd8MHGebrj+2oZAD7kVLG4vEIT0
 njyeOBr9VVbP1ORiwcqB5Cxv/V9li9LkUjGC19SbeKAD7a9lyslPErt5jpQneJSgKar9
 BApbrhMpvP9MJ1m9pGkNXYruB4EfWoWu6QKxHfmVhJ6Ej2AgGmOp4GkINGHssWt21FKj
 B76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761813436; x=1762418236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0H69JoG/2rJHvdEOAXH5NLL2iNrX6QKlodTNw1vRLt4=;
 b=JFVaOl8ASCpuWncgtTzSgKaK+lMCQZu8j+gsC+ZOT8mQWB6CejmCIRlXZW73eDVUoV
 5FTvqO+nIQ4JDGTzpvUlT1vRbCvV3caWeg2n6uvTMnO4/nLNlmFE98i3E2sC7r6Zl+b0
 lGDP+fDXFVJfv42bNXMRZRCv2RceEjEyWWaXU7P1ZWET5Fzw30l9QhLStpREKNy5OzLQ
 Ig3N7EOw3FXvSm/Qy3cJ5HHup/MeTeggO7iZZ199VP0/Ew7BjYptpMdIZGJAszqGGp6e
 glk/QSQi2dQGmFyBaN9d4FbCcYXGPsaVaC8TzEX+5zipVzlOi21Zf/aQKID62rCs0Uta
 BLdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5vI5Z/RI15rVfKSkGK9JD3hLQLdV9jerT4bT3gvDPoyslEQYgIfXGov9wDpGaLHAuniA5vLuRCdA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUMtYM0/ELBmDAy9cNfUlAmnFMM1ECIf5QuEbf1HnyymRuDFYo
 /A8+fr8YlmNHQY5lBCW9rLOfQFL6GYCvoNTwwVy6jp0iDc/FnTYMeaLp0L2lj6JKvZEvQ2HoTyP
 bj0sew8YFTtGg3EQhS//8pY4wfwXkCEpMeXinMTF73A==
X-Gm-Gg: ASbGncv5NGOv1ypfg8h9rqLOjmQTNRFv+557pBydc4K29D4ct3RGhDdRasYKiJmfuYp
 uh4OdFyKx33MbCIOj40sA5W23FXrwxvrlZtKeq2q9dotUj1R4OPDW20ZEhlEuFp8Fvyjk+5yxvs
 7R6GZ6fpIuJVbKEBAj6ndV0rk1FMCwqH8zu0vrbR+j7KUmPe+BXUo+4BXpbr+ako4K/m8Fb2Nqk
 LLNj9P7UnkyAi/aJq4b+uUAtV9bh1hAWiTLirAvRuyl+nNSooAHGVajCSjKwroyTDr6Ll5NFVmi
 saDFmB8gjJ9/JucrrA==
X-Google-Smtp-Source: AGHT+IG3gjuQpHSwEBxVko51wOHMRoYO41Dp3MqxnULe10xLwSMQ6tOVJ17T9RQCsvuInjHrx4tUt76Y0BnH18FeVPo=
X-Received: by 2002:a05:6512:33c3:b0:592:f484:cf6f with SMTP id
 2adb3069b0e04-594128b10a0mr1574453e87.26.1761813436530; Thu, 30 Oct 2025
 01:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251029165642.364488-1-marco.crivellari@suse.com>
 <20251029165642.364488-3-marco.crivellari@suse.com>
 <eafe034a-0c87-452e-b202-bd53fbdf12ac@linux.intel.com>
 <6cfbb32b-7866-4fcc-98a3-1ded4558d43f@linux.intel.com>
In-Reply-To: <6cfbb32b-7866-4fcc-98a3-1ded4558d43f@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 30 Oct 2025 09:37:05 +0100
X-Gm-Features: AWmQ_bkTbTc0-yWVMyGAw-n2TS8F7Xu7uSbtF9NoAnfBvC6747-bXpR13PxTOCc
Message-ID: <CAAofZF57u=Bp0AusvQDZnAmtDjxYDc0oQwr8JVBJh4vQQtO-KA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel/ivpu: replace use of system_wq with
 system_percpu_wq
To: Karol Wachowski <karol.wachowski@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:46 +0000
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

On Thu, Oct 30, 2025 at 8:47=E2=80=AFAM Karol Wachowski
<karol.wachowski@linux.intel.com> wrote:
>[...]
> > Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Pushed to drm-misc-next.
> -Karol

Many thanks!

--

Marco Crivellari

L3 Support Engineer, Technology & Product
