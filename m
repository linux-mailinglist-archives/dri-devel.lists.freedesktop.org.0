Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132741417D6
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 15:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED2B89F8E;
	Sat, 18 Jan 2020 14:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9C689F8E
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 14:02:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id y17so25284526wrh.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 06:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Mx/XHEqC0srgOj0wDJPRlAsSQQIeN602CXOTKoXBgrI=;
 b=sVHFQ/9YgSk+vaNtmyF1GXkw28PX2FDGabYlRYvfQXR3MHXGEQf58Q7OJTDsdpItFe
 vnmEAXCdA7+vDQt8iJH1ZA49nrgA41XXl7Xk8kWdCVsnGj7TxSIw835EYiYsk7OrQqBl
 4ZJANXJ0WmsKJPxJlFYq2s/OU5gzZBPLyz9kujgmfZjCdetCr0llyG1CEtkraE26gCDC
 my2bv6Na1Xga3zbIhXx3mPV5v1xzvqjqVieKl/+NYh+atZrYM/IuHj2UVssE6qD7OAJl
 AmUJSk8mQPoeuZO4RdZMTMAkfqaHGS/W31BZUupoo9JJ4ENH2EH6VcHJqlYqT8QGzVjf
 sReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Mx/XHEqC0srgOj0wDJPRlAsSQQIeN602CXOTKoXBgrI=;
 b=FZdwPmwncKlaPjBfjDsY8+jSK7pQEgJZZHnmVxoFTOMG2arjYKIi0XoIhRdKv1TvVn
 0Lwdy70bcEEOiZcqO+eE+0CCXNb7sdOjI+Tw1sfLru0ybb9MxPOzBvOqMb7Bn5NnnjzF
 GZbtlkhUdLHz4+p+/yG+wM4GnKILu3eUDvJTtpamG39pNvxCsr6LslYbUSU+90A8sFir
 bluuvxDY/UnPWivUhp1uZFLBbaYJIHhkZsEtUDVE7060Po3aNZTsBK7aDG+zkcZnOGY4
 8+vpktMvT/l9yjOv9z0UYLJ24CL0q35R1MHgBn/20e/KQoT7+gfJhiTHbXbbNbpfarjv
 FXtw==
X-Gm-Message-State: APjAAAWHOH6V7IdmXsGRk8oBrpvEZCsyv78JALa2c9Vbh/Wpp/qBiJ1o
 OCDk1PlQ+Rs5cQEIQS8wtZ6hqe1l
X-Google-Smtp-Source: APXvYqyB7XYiAkB3i74PyEPco7ck8PKPtZLNOb81xCnMP7lmMS7uxroaS3X3GO3d5yIzXfsM9KNp7w==
X-Received: by 2002:adf:f8c4:: with SMTP id f4mr8154245wrq.243.1579356134644; 
 Sat, 18 Jan 2020 06:02:14 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id i16sm15051304wmb.36.2020.01.18.06.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2020 06:02:14 -0800 (PST)
Date: Sat, 18 Jan 2020 14:01:42 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200118140142.GA596@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-jEV1crEzGk@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-jEV1crEzGk@https.bugzilla.kernel.org/>
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

What is your CPU?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
