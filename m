Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E96472E774
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CC810E3B9;
	Tue, 13 Jun 2023 15:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F10A10E3B1;
 Tue, 13 Jun 2023 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=2SJDWDPhp0gjXKO83sRx30AxnfsPbJ+TkvDdczAUaQw=; b=Oquei1SzdLbi2O5mcqwSutVp2j
 gjN0clYhJNLxNP6AUsoZfSQtRr1hEpOv/RK5AU+U+LwsD+zx1Ykma7KlsLiETRk5wYp0q05GObM7K
 zN0N4Qk0K6fQ2A64kU6kmuwix/HCvS0Mw6NI7IzDpfJi0EWQbQvVUoblLjxd8pI2m/qtzvpcoeSjr
 BbvKT6bKeNstFkpRO2F3J0/dadfEUPIQPlpt1b/KRbrwqjM2km/VUpNg53kpfJYXJMh6/0JHepwLv
 LR7fBTwOLpL/5wdeey+YxaFINMO3bzbUWV+K9mizYcJUmMatXdROJ04ca+6VhyiXHLtcw2QLr2S74
 VwwLHNrw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q967U-008V3j-2b; Tue, 13 Jun 2023 15:39:44 +0000
Message-ID: <89adc1ac-25a0-6eb6-4cc9-ab6cc8d49730@infradead.org>
Date: Tue, 13 Jun 2023 08:39:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: linux-next: Tree for Jun 13 (drivers/gpu/drm/i915/display/)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230613165903.5cc10e58@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230613165903.5cc10e58@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/12/23 23:59, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20230609:
> 

In file included from <command-line>:
./../drivers/gpu/drm/i915/display/intel_display_power.h:255:70: error: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
  255 | void intel_display_power_debug(struct drm_i915_private *i915, struct seq_file *m);
      |                                                                      ^~~~~~~~
cc1: all warnings being treated as errors
In file included from ./../drivers/gpu/drm/i915/display/intel_display_power_well.h:10,
                 from <command-line>:
./../drivers/gpu/drm/i915/display/intel_display_power.h:255:70: error: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
  255 | void intel_display_power_debug(struct drm_i915_private *i915, struct seq_file *m);
      |                                                                      ^~~~~~~~
cc1: all warnings being treated as errors


-- 
~Randy
