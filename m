Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6432495B0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F54D6E1E6;
	Wed, 19 Aug 2020 06:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE77899D4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:59:37 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 74so10611582pfx.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=LBK59hoC/QeRiJTHTK+5CDgO+Kpr6UH6snOINOdNcEc=;
 b=dOK2BsUAC+X5cn4UBcaTivDHVHteQhdCDednUL3JgbPE0LOySnHHNp+kxYp4Lv5hFv
 OZtGYvKkoFMin6uNX1fpS5sMdOvPh43Y+szX4VYbJ3utQ2drqua2Q3lYg1+/t+WC0OSP
 Vr0/W/jEqyXLCcSw9VpAABGrGf+ZxjFwXWtYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=LBK59hoC/QeRiJTHTK+5CDgO+Kpr6UH6snOINOdNcEc=;
 b=DszJ4zit3xmptWESwMd/6GXqZCdmKWMquex4O+SGpxfEJgvZVHaIP2w1CYwdW9YtKF
 xP7xyP86RPQvaIZn+gCJ8+5DUSlBChnmt2/W/Z4Zcrd5iUx9dMe9IC9JB3kqSusXfLOB
 xjvPc8ma6Fz7AT+ogyRN5Zie5/vIB7rUBUkUs+Vs14npFsvA4BJN9A4vu9FF6RbTikyh
 MDimcYUvVgja61bEhe9AVcPDnJpFsYb38gHL47hWd07HKx1Je3IWpK3m35UhPshE9gu3
 b2C6q4E0Hhghsk4z0MOY5HwuRW3nv7Dem0DgjCFnapyHXvY4ShIWGsEmxDzIMDCQRrb9
 zEug==
X-Gm-Message-State: AOAM5336NPJ0LZ0gPYUVeDkMbwe+C+s1skGHqrUaAzggRqhFdaJ2kO7T
 sDvjQc5azaXiiFuf+EOmqrkNFA==
X-Google-Smtp-Source: ABdhPJyS57EcdCietirtZsste3Gi4BbiPyYRBoBbKZ4T/VQNq4avYwEZDBCDdLGtQZOv+9ZD6nUmKQ==
X-Received: by 2002:a63:ab43:: with SMTP id k3mr13655112pgp.426.1597787976692; 
 Tue, 18 Aug 2020 14:59:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id x28sm26049746pfj.73.2020.08.18.14.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 14:59:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200818211546.559-1-khsieh@codeaurora.org>
References: <20200818211546.559-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v3] drm/msm/dp: Add DP compliance tests on Snapdragon
 Chipsets
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 18 Aug 2020 14:59:34 -0700
Message-ID: <159778797494.334488.5009772006048435758@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 Guenter Roeck <groeck@chromium.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-08-18 14:15:46)
> add event thread to execute events serially from event queue. Also
> timeout mode is supported  which allow an event be deferred to be
> executed at later time. Both link and phy compliant tests had been
> done successfully.
> 
> Changes in v2:
> - Fix potential deadlock by removing redundant connect_mutex
> - Check and enable link clock during modeset
> - Drop unused code and fix function prototypes.
> - set sink power to normal operation state (D0) before DPCD read
> 
> Changes in v3:
> - push idle pattern at main link before timing generator off
> - add timeout handles for both connect and disconnect
> 
> This patch depends-on following series:
> https://lkml.kernel.org/lkml/20200812044223.19279-1-tanmay@codeaurora.org/t.atom

There's a v11 of this series. Can you rebase again?

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Guenter Roeck <groeck@chromium.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>

And fix this SoB chain to be proper with Co-developed-by tags and your
tag coming last as you're the sender of the patch.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
