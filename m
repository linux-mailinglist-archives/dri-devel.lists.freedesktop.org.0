Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B0198D0E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5BF6E566;
	Tue, 31 Mar 2020 07:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4576E439;
 Mon, 30 Mar 2020 15:55:53 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c12so4056450plz.2;
 Mon, 30 Mar 2020 08:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vqMlIY4CwYibDEJ9TyvLZiDUXi7z7rzq9FLu/dGvS5E=;
 b=lcQBqaHgBT15OsAFPxvGL+by0SnSAWdN1bXL1QC/hMHTWy5e3TGBhszy2CEO3xPVVJ
 p5GrFPd+Yw2Kb9ezbo8OTtN393ZXAFHJyenY2Wl1eJWlm4rtnoZbGe6F3viSAbmeaR9L
 hFgyk6cjQivySWMGKKOHdbEPWXSiF0BIhwlhpk5m2WIMrSHbtPgbFVo2SBhQ8XI6v9si
 BsFjSXtKDWtQPeRfo61EdYRveHMbT68hk1WwwwdR7b5zPyrSTfSofPM3tSea7JAGceNN
 vOln1YldB2UcOLJw1fcNYoEUIH5N4hesd4LLBPWvI/ImOjqJPFSRpxnldq5KbpD4c9Wu
 utuQ==
X-Gm-Message-State: AGi0PuY7k9oz0ywCjlsyhVngD70uR8JFrH9V7Q6YiBOHbcN+W5deQOER
 dcNQKIryq2jfmNqnYbPIwN283Qlx
X-Google-Smtp-Source: APiQypLG+zHRr1QDgHfHrS55bEBmIevqM557WQZBCWw+oAV2e7y/pED0DMpyu4z5HHcS+RaXFbQ0lQ==
X-Received: by 2002:a17:90a:a414:: with SMTP id y20mr3779pjp.124.1585583750671; 
 Mon, 30 Mar 2020 08:55:50 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id o3sm1012282pgk.21.2020.03.30.08.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 08:55:49 -0700 (PDT)
Date: Mon, 30 Mar 2020 08:55:46 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] A couple of important fixes for i915 on 5.4
Message-ID: <20200330155546.GB2022@sultan-box.localdomain>
References: <20200330033057.2629052-1-sultan@kerneltoast.com>
 <20200330085128.GC239298@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330085128.GC239298@kroah.com>
X-Mailman-Approved-At: Tue, 31 Mar 2020 07:37:59 +0000
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 10:51:28AM +0200, Greg KH wrote:
> On Sun, Mar 29, 2020 at 08:30:55PM -0700, Sultan Alsawaf wrote:
> > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > Hi,
> > 
> > This patchset contains fixes for two pesky i915 bugs that exist in 5.4.
> 
> Any reason you didn't also cc: the developers involved in these patches,
> and maintainers?
> 
> Please resend and do that.
> 
> thanks,
> 
> greg k-h

CC'd. Sorry about that.

Sultan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
