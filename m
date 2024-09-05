Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8377596DD3D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 17:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0FE10E8FC;
	Thu,  5 Sep 2024 15:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB29110E8FC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 15:06:34 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-206aee40676so8759845ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 08:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725548794; x=1726153594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7TTRuuU4nlji66HB0wIsokyLV65QcKx5Ad6l4uBmgg=;
 b=paLy9v2qGGWtKo2hoZRDFboh63WNv/7vVW4Mf1QVsuvs6b08HAlFkp2T4TOXwhTCE7
 yE3pg+VOMt35LjdDUvUcGIBwWlpnrIoqUYp1uHP/m5gIX3+urEs3itD8y/8WPtqjpf4f
 w3VglCCX0lF6yw2lrlxghOicHU3PqmKelRGBoHqPyhg9O1K22kWYRkN4z8nGka2OcjN2
 cHFcWHi5oTBoD+Vg9xPN+tCxPIybE6rsjzbe8bXEGGCD8wwO4oLWwNQ5mCIQ7QKu8VHa
 oINJZYYwDbx7PnGKmKpNhl/91YbYiknfakIk6yiitvlBBPDKJoJYLD9CDmnrRLA/LIdl
 foIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs+YHpmWeZVTT17ob9TDJmbm7k0kGgXr9ULSADimziJuKKQbVPFqbyzrILeHVWor5I5V2I1UuCvhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylVoDfyJjXznd85VUSRvt85H9WOyc26E+Hb7QwAS0w6x0j9BTL
 xH0e7qFrZ5p95ToC1AvwObayjK90joSWmlJluMz9xKaM9KMFa3uB
X-Google-Smtp-Source: AGHT+IGStXj7Q9ESrdDcPCzdegEEQ6geuDnclkkUo7eimkLKqJZy6a3xGuNcr2bAYNITzcnTIAKDTQ==
X-Received: by 2002:a17:903:3586:b0:205:8a25:c11 with SMTP id
 d9443c01a7336-2058a250d9dmr147178855ad.45.1725548794015; 
 Thu, 05 Sep 2024 08:06:34 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea5832dsm29588925ad.237.2024.09.05.08.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 08:06:33 -0700 (PDT)
Date: Thu, 5 Sep 2024 15:06:18 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Wei Liu <wei.liu@kernel.org>, Chen Ni <nichen@iscas.ac.cn>,
 kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com,
 gpiccoli@igalia.com, mikelley@microsoft.com,
 linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/hyperv_fb: Convert comma to semicolon
Message-ID: <ZtnI6uWpRVf1Bvx8@liuwe-devbox-debian-v2>
References: <20240902074402.3824431-1-nichen@iscas.ac.cn>
 <Ztlc52c6fIz3azbn@liuwe-devbox-debian-v2>
 <5f6ce496-15cc-45d1-b3d0-10e362543a3c@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f6ce496-15cc-45d1-b3d0-10e362543a3c@gmx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 05, 2024 at 10:30:56AM +0200, Helge Deller wrote:
> On 9/5/24 09:25, Wei Liu wrote:
> > On Mon, Sep 02, 2024 at 03:44:02PM +0800, Chen Ni wrote:
> > > Replace a comma between expression statements by a semicolon.
> > > 
> > > Fixes: d786e00d19f9 ("drivers: hv, hyperv_fb: Untangle and refactor Hyper-V panic notifiers")
> > > Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> > 
> > Applied to hyperv-fixes, thanks!
> 
> I added it to the fbdev git tree 3 days ago.
> 
> Either you or me should drop it from our trees.
> Please let me know what you prefer.

Thanks for picking it up. I'll drop it from my tree.

Thanks,
Wei.

> 
> Helge
> 
