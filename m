Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003BE1411ED
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421306F8F0;
	Fri, 17 Jan 2020 19:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D7D6F8FA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:42:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id y11so23838708wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Vq1NSNs1p/oVy8zuKJ4lGBgJdW7jBrxS1hkW6fJhGzo=;
 b=tJHDoz3toPgEZR2WylTSgeNsyxFLlb3uCO4adMDKFR6jaJKitIZ3nQTwBa3ySQZ5Mv
 ArRDMhQRyTfvPVY7vw9Tr+Pvk8jNSASeazLs6LJxmpKKSEZ/YO3dV3p13Otpf+hFHGWA
 MwI0s/KlMD3EQ8syohOh/5PsKfha352Mfrm8Kns7c6GKh7nD/KlqC4GJzXH5QOT9H1zT
 ibX5e0wdRB7jO0UIXQ5OZDLh8d98VAPDbQ3DYe9bKH5ojTUXd9kXSx0zb6O7mETuQmcp
 YuqOkffuIJn2fNrhnbL1vc4dvswYBOy85m+ZhG6JHizBUZoNJawLW5/YR8ZfLeRNtgSd
 FFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vq1NSNs1p/oVy8zuKJ4lGBgJdW7jBrxS1hkW6fJhGzo=;
 b=COOPo/LIzmLi/9yDpR97qbo0mJGULCAb35FDEDDIz8r8xXeCqcA/dUDvUxdaD58WI2
 cnXNT7CigXLHwfqXurN45uqmuARGKVCAYYgjN8GSq5rwfeK48iIfEE8flN5azVBcpqvO
 11RNlt4MQHGBFBswpFimwEZdJgPWV8HdaQVYJD7o/QKVNSMQptNhiU27UmlE4f3LeO1n
 L1Y1g1pGQ01TwIvEa43IudLhU/nrnV9uL3MHKmv1qPNbx8uPPWo4x+p9J+W8kXWlw2r5
 dDrB0G6btzbIIpHcSQXCS1eNB72C013tBJnLx7aOvNdZVcrZ5A7Dv5ZpKDZUV5zTdtZq
 aAuA==
X-Gm-Message-State: APjAAAX3LkanbgBJbxm1H90ebjj/7T2K22H0/wF7qyF0P4xX8QZGKrve
 0l7BFEdV7uiroQLBA1hk9ihQu0Fp
X-Google-Smtp-Source: APXvYqyEJvUoBAqYhq2kTFB760fYq0rv//K7pY3u+SiPniJwg86VqtY6NWJvsXj9Wj+oNKBZJOfpEA==
X-Received: by 2002:a5d:6a10:: with SMTP id m16mr4754921wru.411.1579290141319; 
 Fri, 17 Jan 2020 11:42:21 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id x14sm841854wmj.42.2020.01.17.11.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:42:21 -0800 (PST)
Date: Fri, 17 Jan 2020 19:41:51 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200117194151.GB3904@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-2nCXs4Vm2D@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-2nCXs4Vm2D@https.bugzilla.kernel.org/>
User-Agent: Mutt/ (2018-04-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wow, this from the first tomb raider, the one from 2013!! (7 years ago).

Sorry I read the emails in the wrong order.

I don't know own this game, sorry. Another game perhaps?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
