Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E4F303813
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6190F6E43F;
	Tue, 26 Jan 2021 08:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BDF6E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 20:29:30 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id i7so9716535pgc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 12:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=DCEP4gnVGuX122R3MmiG4Mh/J3FSnjqd1Q2nTdmlp1A=;
 b=czO9lF4xQAIchrxIYbplkf7nO7CKPxP42s+chuaVhLevnBowti/kngBiCN3dHGZNMo
 EPwcaCxAeCPYb6HjKn+SA+aqJnxOE4xGXRzTL5iCSSmkVbW8qZtKFtX/nQXl0qED0Huf
 lFUH1SxNF/RYJrbSxmYPLfRwv2m8dICrDWmCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=DCEP4gnVGuX122R3MmiG4Mh/J3FSnjqd1Q2nTdmlp1A=;
 b=AXvTK9LnhDZaRARouXIjyuJACK2vBLAw0Lai/0VHJUgydG3oIgqT+FSnbneOjsHGqP
 YGxKbpz+Zd/cnTsfu2KWhOdz66yRrlVugmKCdvuf3aBSdZlqEDGP/Ml9pCMFPHXUfAod
 pHsxwuYurWQM7Y7gU1i5srlSeqKCDDSiA6WglL796KW6Jiust/3opleAPB2YDNHGVcXx
 pLIcNaPQuFnu+11qus3d01tRDgVOii+W5lUU0GEv+z8xBZRiFd3qKn/bBO+42uCShGx9
 I25VuCmhoMci/6QI60pwBCsKUjO/y+9WPBUjhvVkLVnhnXaM4gSIAs5T2My3DULJl5J9
 wY9Q==
X-Gm-Message-State: AOAM531SdZC+xVgAZQRYp8VUAodqaUrGWe7oP0s0zRTj8fWNwyb8OW6P
 qyoIYrKsUUoI/HMqgc4EEXut3P7tz81cew==
X-Google-Smtp-Source: ABdhPJypmTAXXNM6u+Jcdgi8ZKzmQ99oJF1tF2CC/PL6E54yVkqgPThSD13OYhBvfX4XNr3XcchQSA==
X-Received: by 2002:a62:36c4:0:b029:1b9:7ca6:5d6b with SMTP id
 d187-20020a6236c40000b02901b97ca65d6bmr1913863pfa.43.1611606569745; 
 Mon, 25 Jan 2021 12:29:29 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:1066:b437:97cd:2278])
 by smtp.gmail.com with ESMTPSA id t206sm17377408pgb.84.2021.01.25.12.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 12:29:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210115144345.v2.5.I3c01f3aab8335cb509da7009d8938c1a27a266dc@changeid>
References: <20210115224420.1635017-1-dianders@chromium.org>
 <20210115144345.v2.5.I3c01f3aab8335cb509da7009d8938c1a27a266dc@changeid>
Subject: Re: [PATCH v2 5/5] drm/panel-simple: Add N116BCA-EA1
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 25 Jan 2021 12:29:27 -0800
Message-ID: <161160656766.76967.8403671583757705105@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-01-15 14:44:20)
> This panel is quite similar to the similarly named N116BGE panel (the
> nominal timings are, in fact identical).  However, let's add a new
> entry because the full range of clocks listed for N116BGE aren't
> supported for N116BCA-EA1, at least according to the datasheet.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
