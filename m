Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC16622DE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C6210E3C2;
	Mon,  9 Jan 2023 10:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9624410E3C4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:17:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id l26so5878105wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rDNF2nq4b9KxYEgBtOKFU9bGBLHmMD8mjcoecRR8JOo=;
 b=Egiyt8t8NeEPoldU+PsuMHoanqPPDdbLc5AyDm0+6oAWOFis5vdQtE5/FvQHaJJnhQ
 OuIfStlXNBRlfLFjDGfyTKUrPDuKQoyBgyHjErZyYUYct5mgqH9SeVXKMpbRF4KGIXWZ
 WwDyG99fgkUfBCwlWm8+yKbGSfbIbon+k6//kWKlqatplP0564wsAvcqa7e6HMxqG9ZV
 Prs+JDy8t6GKuek1QRak6deutcLpdTM+FsU1QoVwtl/yADesOj1EG7SvsswBTrbfWy/q
 3IUEcRv7PsptoNROWnj7mx9IFyBBRkjrgiLm05N0Kn4C2YhRrzDPTLHS3wuteHcs3se7
 i1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDNF2nq4b9KxYEgBtOKFU9bGBLHmMD8mjcoecRR8JOo=;
 b=W1QAqqQmGcG1rPt+Y27DHKY3YmQzNrjFDdB7P4mS0XhkCAkEUqUNWL2P7xFQjJoMWO
 0+3CoEQmlMl49d4zKEqrrdVRS3R1Zf0x9xVggWTqYy4zXB4+oWokBin1K2JgeQISKE7c
 xhRmkfECwFG5RkATeT9dWBdA+nFZ7ASUIKAFTOuNOrtKrPhVvPWJ/S/vao4b2ct/ZaHo
 KKtXockYnnjcdj8/YHTYg4+z8ZM11DjnKUXBpu32FiaQy/M5pOxTySDeT6aPiM0ytHOQ
 Bo/bgJGJBPnppqi18tW477fbiSJd4aUuOm7u0KIiSJ34Enqo2WL3xHRrrG1mjgnK9x6a
 iA7Q==
X-Gm-Message-State: AFqh2kqaskv/tdTUmsQHZC70R8l5YZaMtFDyGnlSayj3JA1gBhYr3JAd
 kbB2RuihIiWBA6O+mn7syI4JoQOAwYKplksBwII=
X-Google-Smtp-Source: AMrXdXtDVvn4E0/j7oBFUTIF1bLHNjmYSsToEWXF24uuZxYxJl7CkWIxhyClEjlcLBHh4/n9Ls5fBQ==
X-Received: by 2002:a05:600c:4854:b0:3d3:5a4a:90ff with SMTP id
 j20-20020a05600c485400b003d35a4a90ffmr48166011wmo.23.1673259428083; 
 Mon, 09 Jan 2023 02:17:08 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c22d000b003b4a699ce8esm14604643wmg.6.2023.01.09.02.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:17:07 -0800 (PST)
Date: Mon, 9 Jan 2023 10:17:05 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 2/4] backlight: arcxcnn: Use backlight helper
Message-ID: <Y7vpof89LHgqdHvU@aspen.lan>
References: <20230106164856.1453819-3-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164856.1453819-3-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:48:53PM +0100, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>
> Signed-off-by: Stephen Kitt <steve@sk2.org>

For the tools:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


D.
