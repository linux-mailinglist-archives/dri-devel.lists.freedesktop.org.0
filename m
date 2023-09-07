Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67A797150
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 11:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4643210E7A7;
	Thu,  7 Sep 2023 09:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE46210E7A3;
 Thu,  7 Sep 2023 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694079816; x=1725615816;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pnR5kstqGfQdtJCcOXHBRX9aXdYhQVq6t+ivw38b4fk=;
 b=iWnFxUPQwY+h/utSZOE2SL9d+VK4V9p/dqQ3N3S5oLJJEPxscFadGlab
 QGyPOicMO3L+934OqMurD0OKI9WwehnyC3KsEkX3ST9i2rRK62lLxrhAJ
 TP+Ugw1/JITmRShZD43Hcxwj0tYKrsoKplO1DsQbUINgvECCa2hMsqYkS
 w3C2XxLslDV2VpCr8HZ3k4bpmDjS5rE9FdyauhC0E5xIupyhshsozNVj5
 5jhdrZ7gdh1vlWQKPopn8hrUtwAV55YNZf4/TJMqu7SGbwteyoouAchiY
 ZvzmBtmoJKKoViIJlFtE6YLnF4nPRYTvfzJg6wYsaZ/EvLG45HRtTPWG9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380025591"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="380025591"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="832092585"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="832092585"
Received: from iraduica-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.21])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:43:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann
 <tzimmermann@suse.de>, Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn
 Helgaas <bhelgaas@google.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the
 user to select the primary video adapter at boot time
In-Reply-To: <3f41eea5-d441-304d-f441-eaf7ce63d3e1@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <151c0429-dbc2-e987-1491-6c733ca159ac@suse.de>
 <3eced3f5-622f-31a6-f8a0-ff0812be74ff@loongson.cn>
 <6035cf27-1506-dda7-e1ca-d83ce5cb5340@suse.de>
 <3f41eea5-d441-304d-f441-eaf7ce63d3e1@loongson.cn>
Date: Thu, 07 Sep 2023 12:43:29 +0300
Message-ID: <87edjagvy6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Sep 2023, suijingfeng <suijingfeng@loongson.cn> wrote:
> Another limitation of the 'nomodeset' parameter is that
> it is only available on recent upstream kernel. Low version
> downstream kernel don't has this parameter supported yet.
> So this create inconstant developing experience. I believe that
> there always some people need do back-port and upstream work
> for various reasons.

While that may be true, it's not an argument in favour of adding new
module parameters or special values to existing module parameters. They
would have to be backported just as well.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
