Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC3A38CF48
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C996F907;
	Fri, 21 May 2021 20:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CAF6E878
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 20:46:20 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id y76so11593569oia.6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AZ3l/zxIL/NOMMAmXJkqt/4UgOSejxRM3iDClSSiQdU=;
 b=Ff8mkYy1VgMh+ceMv4OclUbb7dT8Vk6402dzIimQOhbqu+8TA44MKkV8ZAsriosUqz
 p06OopYcjGNJbv88PHqKd4WLTO0mgUVYJAdpRS6+rW9lVjMTLwwIRwq0f26LahOd3P/E
 oCTM1QXiK5KN5pZ2uMeUqH2/EttXU4R+sdix0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AZ3l/zxIL/NOMMAmXJkqt/4UgOSejxRM3iDClSSiQdU=;
 b=HootGsDAzBLQb9aO5UlGUT0edpgUVKMIozSQKwuoo2Xf4tTFZCCvcOX7VNVW+8HakG
 ZLwzpryUBQ/ykLKLIQp3fxk3SCTzWdH+wJgx8FtHXshXV18ySIEgEod5IaCm88zfAGey
 BpP5R/Y/e/BiwAZutVWq76b7j7TXqVBtGNTr3rlLlfDJG7kP1I1YBGosTKo8DopakYtq
 yD1DMwGncL7uRcARynjSGvMlSo5ZZu19GANDiuRIJ2p+l40HUXPSObNhpa7JuizPqZ5W
 XLF0E8PP6e96NFID3S7H7O76FMR2s5I43Rdq43sAns3S65qSNuAvRB12p/EYHM4VmGGK
 XrKQ==
X-Gm-Message-State: AOAM531OeAKHEu0Hr70jAWl6An+HLumJHZI+MM1JfY1bltw2jn5Mlhhw
 1JHckLDLU0ZbP81rj90nxGQHk0rTpPDiOXwuS5LCLg==
X-Google-Smtp-Source: ABdhPJxf3iGsyJturbsxX9/7bpQ75ZAt2AXo0hzzCETHpkivWeeFM+PMM5T2PS9XqN2XpKKvia6FASJVYpmoO21Gesg=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3612205oiw.125.1621629979564; 
 Fri, 21 May 2021 13:46:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:46:19 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 13:46:19 -0700
Message-ID: <CAE-0n50-VuzX5X1DqFJJ8ZjAjJNsnRA9S-dA+wGxox+nbZetXQ@mail.gmail.com>
Subject: Re: [PATCH v17 4/4] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: vinod.koul@linaro.org, dianders@chromium.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 tanmay@codeaurora.org, kalyan_t@codeaurora.org,
 Vara Reddy <varar@codeaurora.org>, sean@poorly.run,
 Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-05-21 03:27:24)
> Add bindings for Snapdragon DisplayPort controller driver.
>
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in V2:
> -Provide details about sel-gpio
>
> Changes in V4:
> -Provide details about max dp lanes
> -Change the commit text
>
> Changes in V5:
> -moved dp.txt to yaml file
>
> Changes in v6:
> - Squash all AUX LUT properties into one pattern Property
> - Make aux-cfg[0-9]-settings properties optional
> - Remove PLL/PHY bindings from DP controller dts
> - Add DP clocks description
> - Remove _clk suffix from clock names
> - Rename pixel clock to stream_pixel
> - Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
> - Fix indentation
> - Add Display Port as interface of DPU in DPU bindings
>   and add port mapping accordingly.
>
> Chages in v7:
> - Add dp-controller.yaml file common between multiple SOC
> - Rename dp-sc7180.yaml to dp-controller-sc7180.yaml
> - change compatible string and add SOC name to it.
> - Remove Root clock generator for pixel clock
> - Add assigned-clocks and assigned-clock-parents bindings
> - Remove redundant properties, descriptions and blank lines
> - Add DP port in DPU bindings
> - Update depends-on tag in commit message and rebase change accordingly
>
> Changes in v8:
> - Add MDSS AHB clock in bindings
>
> Changes in v9:
> - Remove redundant reg-name property
> - Change assigned-clocks and assigned-clocks-parents counts to 2
> - Use IRQ flags in example dts
>
> Changes in v10:
> - Change title of this patch as it does not contain PLL bindings anymore
> - Remove redundant properties
> - Remove use of IRQ flag
> - Fix ports property
>
> Changes in v11:
> - add ports required of both #address-cells and  #size-cells
> - add required operating-points-v2
> - add required #sound-dai-cells
> - add required power-domains
> - update maintainer list
>
> Changes in v12:
> - remove soc node from examples (Stephen Boyd)
> - split dpu-sc7180.yaml changes to separate patch (Stephen Boyd)
>
> Changes in v13:
> - add assigned-clocks
> - add assigned-clock-parents
>
> Changes in v14:
> - add reference for ports (Rob Herring)
>
> Changes in v15:
> - drop common properties from ports (Rob Herring)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
