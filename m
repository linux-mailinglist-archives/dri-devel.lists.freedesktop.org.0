Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897EC21CDF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDA110EA02;
	Thu, 30 Oct 2025 18:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lP8Nb6eJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A938210EA00
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:31:34 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-87bb66dd224so16669376d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761841893; x=1762446693;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lcro7aS2LTQSDE5KiwibL0iMqZiuCu8FC+2EGOTSddI=;
 b=lP8Nb6eJw3iVSttjDCz/zd4VWGQ7Ow6NdX+WPG+f9a9jwmNYk4TNfcxWcllOFJRmjS
 Gn1FYyahJRBEC4/EywOMES52LVmZUZsZIgW+6Id1xc/i/Y2Vohq5Jz/WCu/WDJ5W9G2B
 djtZwPcp4VxQLlmK3kOIOnQ6tRaNPSXEmuv2Y8gJU+o2tgTjmJWoYmKxqeAJ4/0uAwW+
 kfZsn9gpU4cUutim7m5k1tFhfWjkAoOdU/KXEb8gIyqParabrLO18G916a0yRoOcq9fO
 +0hZfvGMirCf7HdOXuD/RTGi4da8FJ5dlJho6sOZlzZWurZUcDkeDa8dxOPyY3IX0Oxb
 Qx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761841893; x=1762446693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lcro7aS2LTQSDE5KiwibL0iMqZiuCu8FC+2EGOTSddI=;
 b=lTWZzqpyOLjWmae4lgn5UfpSqsRoEJyo38SH9/JCg6yTXej1xt+Y9r3FhJg94l3b/b
 dzFcwPtM15p5G8fS9KB+iKkRyPA9Ka7N+b62RUHqAbF18SNlXEJ9Z7+i20iumuCsycOz
 r94CiZSy45q1+fuVPuxc46dyYxwFx0ABI0mPzq0azrws0tp16F0KpKQUEeAK3UgJNbz+
 12qg+tLJ/TPdyo5AFgEvLt56uQ9gXKPP44Z81A/BgP4Nu2jakAPu5sUvaRzRTJ5bm5gm
 MP5iCHLcd8Ov/sy2s71ND5ErijaQ23lzlUThR02HPlJuVQItp2VrckmBs4gkYTTRAjYN
 3oiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjyTkwPut2VDlzBvT6LtBrDcTxWRtnTBhH3UYS3TpGbGR2k/4YrskljOwa9JbFpOnSjfOqytifFi0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHaKK5jq/Xijvz8nlW8iAphDFIoKCpZ9+Y1mbqy66K7yVXpCXD
 FZFd4eCVm5l3mQJUUx649ZDug/E8LahPqfwfXgdNp67W3zkIRh20n9Uy0swyOlAeD+D6TBvM/1O
 1MzQ/JWSa0KUQhwVW5WEjVrkUZaHQIDA1M0Bhr+Ki0Q==
X-Gm-Gg: ASbGncsdPt1BryP0iqoJ8eyj72xSMbJe+TsViXdr2I2JymjFrJig5jpedT6U6PcjbuU
 /gbMTdksSZemguKY5TLTlkNlHGe8kIOtwnhrFa5HZXS+BuKjWPb87LCsj2MZJ+HdkHjkysyxiNC
 rthLvcbiOnSkphb9KnHeer/r3KfHPGXgxLw0DqSRqun9co3A1HU0nKudaSPr/FekDATsp0hdEf3
 LqotVG1A/wDpoB+gWnfT4Hxd5hFRxBjukI2wRpLgcjCXOYQcY2P2bYipTd+GOY2q1LfG/MDe7FH
 6GIGg4GKq7gIIAF0dw==
X-Google-Smtp-Source: AGHT+IEkj46+/B0K8GIyrlYZyKHcCV6t6mvnj2aOt9aXfuZPt6AReZRXp0RWtwLFCrq6LGljuPZNyWbF+jhr2bn5n/0=
X-Received: by 2002:ad4:5f87:0:b0:87c:2967:fd52 with SMTP id
 6a1803df08f44-8802f2f5681mr2517706d6.17.1761841885454; Thu, 30 Oct 2025
 09:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251030094434.1390143-1-ajye_huang@compal.corp-partner.google.com>
 <CAD=FV=V6xV0m4pj=7f2dxDP-0A1AaQuYJP5NAnXNz1_bzH7nSw@mail.gmail.com>
In-Reply-To: <CAD=FV=V6xV0m4pj=7f2dxDP-0A1AaQuYJP5NAnXNz1_bzH7nSw@mail.gmail.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Fri, 31 Oct 2025 00:31:23 +0800
X-Gm-Features: AWmQ_blljuOVJEoWM8HEfx4HXzb3s-EmtRR_lYI7XqNnS-lC5zNQ1CNEjOYQWaE
Message-ID: <CALprXBYir7u3N3x6pZ_VK73Nrp5dP=qt5LCnUdhrjeQo4s1JsA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 30 Oct 2025 18:42:35 +0000
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

Hi Doug,

On Thu, Oct 30, 2025 at 11:08=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:

>
> NOTE: in general if someone is involved in the discussion of a
> previous versoin, it's good to CC them on newer versions. I've added
> Jani back to the CC list here.
>
Yes, you are right, It's my rudeness,
I will pay more attention to this detail in the future. Thank you for
reminding me.
