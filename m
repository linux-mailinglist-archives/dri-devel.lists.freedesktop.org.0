Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD21D421B
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 02:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BD26E3C7;
	Fri, 15 May 2020 00:32:07 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA6B6E3C1
 for <dri-devel@freedesktop.org>; Fri, 15 May 2020 00:32:05 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id n18so154107pfa.2
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 17:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ksohmisiygmMHSWmZNuyiGcxOl23DTxWznhnrAA0Tbc=;
 b=cPk6Aai/Cgvqt0Hw0nAvV2PJi+S+U0lQ3s+kR1zT8quJNLuBg2FCokbhC2GzfDSzJJ
 F5bmAzSUpSBwRoZ1Ym+YE2Zs64UYZ9YUoW+PRgtrsZynF/QJDpka4gEPcaI0pKdfmbQA
 B4Z8rYbMian4pw77PaNRSd1O+Vcxwo0afwBs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ksohmisiygmMHSWmZNuyiGcxOl23DTxWznhnrAA0Tbc=;
 b=BpNkiMq05Fkt36BBqU3EvC2iJ56plRm2DS6NlhBpeLuXE7SCJI1gSFPXnRQ3Qfitjn
 nI11HwKnW6MhDSIzcZ4LXrKeatKXhLu05yYIh6KHNTjftMgan2fZLG1jHwBaGUpmNYxJ
 NMIhEugbe01W+SBV92ibEb8Ftob7VqmJSq16zLx5+PfrJxSUHMVo1OjAacIK7y05cfdE
 hdf82H7Mspd+jUXsInQlkGm15ROjesuXtjMko4VtUebr4EdX2pRh2mzBVT9+gexjFh1p
 cOANL4jrZmOZygsPHXTIYXHJwgkUX9AsKUe2/yg7EujrvV2sarg2+W6txZsn2twEeI73
 jlfg==
X-Gm-Message-State: AOAM533nG413aJMPh/yvAzEIO/uZugLlGQQPKilcHstu34XIqVqUcICR
 FnsXG7dKuVFtMY3W+j4iHtecmzxyy4M=
X-Google-Smtp-Source: ABdhPJxP4fdAV/QiAEsyatfE+OPdd5pusF9BcQ3lUqxkmtep+uuG0U2tNiNsF7/PknZVYJq9lJXrlA==
X-Received: by 2002:a62:8888:: with SMTP id l130mr1187943pfd.140.1589502725382; 
 Thu, 14 May 2020 17:32:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id z1sm163461pjn.43.2020.05.14.17.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 17:32:04 -0700 (PDT)
Date: Thu, 14 May 2020 17:32:02 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 3/6] OPP: Add and export helper to set bandwidth
Message-ID: <20200515003202.GU4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-4-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-4-git-send-email-smasetty@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 04:24:16PM +0530, Sharat Masetty wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
> 
> Add and export 'dev_pm_opp_set_bw' to set the bandwidth
> levels associated with an OPP for a given frequency.

Wait, this looks very much like Sibi's patch from v4 of the "DDR/L3
Scaling support on SDM845 and SC7180 SoCs" series
(https://patchwork.kernel.org/patch/11527571/). Please don't repost
patches from other series (unless the series/patch was clearly
abandonded, which isn't the case here). Instead mention the patch
as a dependency.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
