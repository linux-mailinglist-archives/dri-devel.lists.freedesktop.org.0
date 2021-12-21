Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D847C35A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 16:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F1210F4E1;
	Tue, 21 Dec 2021 15:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE9510F41C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 15:47:34 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id k21so12137052lfu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 07:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P/AjqKnlbhjD52zhKuwLST7SIhcLpZikm45Z0zGIr8g=;
 b=oz1TU+1UCx2PBCN4OQBrtioUPbG6hLhpDKNcLgx9IEUzhslAyNQT+3S/srKEeF/0L1
 mnDjOYEhP/7M1h0rnzPr5H1K6gZPtML7CnDtqjnJBfPyj8AvdpMcIJTFcQrqvOKFrvsE
 IpNCoO23yd+z7bpbjZH71rSKMDI/KiwYpoojjEDHKADkEjbH+80NXYFVhJyogR9YjLhZ
 XdDv1GggRi/wCWqiMd1WOiEeKTgMK3qYnku7fzegx6DuXiy8I9bQ87Tnp0AboAc4gLl3
 zERM1MYIwOjuaXXt32oMFIkx9YAsfQBiAyIL2VDZQLZh8tyH6QD9bf9Rw8YWTTNy3iy9
 hSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P/AjqKnlbhjD52zhKuwLST7SIhcLpZikm45Z0zGIr8g=;
 b=XeOIJMJEyRT2ISCZs6uYsGrUcXeS4rzwg4WxVQ+8qz5EHFalqAz59htm1P1BhXfdVX
 cvYYp+FiOaiNI6/l147pKF9haA9B7R9WIRIoqZjXmOHouszha6Pj+1hcyf+7+1VVO5E/
 iU3VlJKFuNLwlakVpLE+uOkHXGKl+zhA3ZGhDUWOqs7LqAydR9ca5JC+k0Q1EYnTyVi9
 7rVjjheIbCjpivMotEX/zazn0+OVcOGg8DVC3NXFdBSRFIkZasDUEDdoCIF8d+6fslA2
 qJObWrseg6TFIjinCSdq1j1cNCXJ4fJQ3bgbsq22ZZks6hSJCOKk5/iZN3CjEhvHCtxJ
 U6HA==
X-Gm-Message-State: AOAM531T1st5Cv4acAlM2dNXKTbF4bbVx8ZBnO3w66R6VPPxyvqP1VW7
 AZrPFSy021FBnQtrHIwImk8=
X-Google-Smtp-Source: ABdhPJwpUWaPqAbiSqRSSP3dYUaQSUPtyJxaTeDK0cFwBA/ikKMVtsdvGE+98TsRLV0XpDdW/0aYog==
X-Received: by 2002:a19:6e42:: with SMTP id q2mr3478719lfk.60.1640101652838;
 Tue, 21 Dec 2021 07:47:32 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id c20sm2767716ljf.37.2021.12.21.07.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 07:47:32 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com> <YcGzO0A/iWzhFjvE@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com>
Date: Tue, 21 Dec 2021 18:47:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcGzO0A/iWzhFjvE@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

21.12.2021 13:58, Thierry Reding пишет:
..
>>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>>> instantiated, AFAICS.
>>>
>>> I've tested this and it works fine on Venice 2. Since that was the
>>> reference design for Nyan, I suspect that Nyan's will also work.
>>>
>>> It'd be great if Thomas or anyone else with access to a Nyan could
>>> test this to verify that.
>>
>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
>> 2023, hence we need to either use:
> 
> All the (at least relevant) functionality that is in panel-edp was in
> panel-simple before it was moved to panel-edp. I've backported this set
> of patches to v5.15 and it works just fine there.

Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
Nyan to keep the older DTBs working?
