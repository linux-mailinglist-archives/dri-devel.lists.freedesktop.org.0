Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30D148AA7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 15:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D18C6E3D6;
	Fri, 24 Jan 2020 14:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1EA6E3D6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 14:52:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z3so2322844wru.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 06:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hKJnlBCEm0npZ1HgPfdiUQ4gQAkpkg29dW+vmnSbvjM=;
 b=HjgpfPYexLNAIy/UxhlFUBHWGotxmVHX1qqobXgJlooL7cLmPpv4vYRq1e1bqchFQu
 jWGPZQT+7P0zIuItmHKk+TQ1kpyfDT2nYx1wQkbKmoW3/5FD2bAIUxe52N80ijxJ/pnL
 7Gdjdh57PNqUaJWn4dRMkVeVsVbjMkHWCbhVrDF2PWUyE3o5xmO2GLkyNsXUZ9LWP6ma
 0DvQD+11NgrM811TAwuio4rWUEZ85+VU6mVENov81JBMc4/KFNGtrWBi9sO5dSFs/N2h
 ZQ0MimaHw81zSJnJLFX2M+LcYxf4pLK70AHRds3CPQCyqeNfkcXFv3NbJDg/yzZ/Eg1+
 tpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hKJnlBCEm0npZ1HgPfdiUQ4gQAkpkg29dW+vmnSbvjM=;
 b=fOe3/+Pt7m86ssPDgey4vfXFZb+1aLsqJlvgPEekcuIbHLwdxNpRUyiAJ9XWj9IYPX
 gZZtIz1AN8uEBQh82XR8lHby+cb5Frh/DdQJUpgZa3n22piBeC8dufYChesyro1Hd0br
 Wy8oNcW90Bc9+KmKAK3NbMqPM8gAQyxmuCzio+VulDXGgJgHX49S9Cmbls57km6nPxeu
 +JI7DK9c+mGoLuTpyeYDE2k4JuO6W7PHjy1dt14UOsELVP0pnbEjO0uAc1t6eCxp0byA
 lXgF4fKOpnvabsFGUOMxGtoqt6rh9J5j1E+lPRtnNxpVjr4AlA20AOGOBoSkP8rDvOFP
 OrnQ==
X-Gm-Message-State: APjAAAVuc5Et4gzKxywKUAkm4OzVFQ5aJ5T7UrVEjFjyF6nSHuEIvPeI
 y8tdqqGm72VZkwsor6PD2f/9RXzv
X-Google-Smtp-Source: APXvYqzzQQuKpOW33k/RVlxdinpCQfzcvZCv+473njt/hrF5qJfvRbjQffqbb/5kGTgYS3jRK7WwTQ==
X-Received: by 2002:adf:e692:: with SMTP id r18mr4739063wrm.413.1579877572726; 
 Fri, 24 Jan 2020 06:52:52 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id i204sm5923974wma.44.2020.01.24.06.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 06:52:52 -0800 (PST)
Date: Fri, 24 Jan 2020 14:52:05 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200124145205.GA400@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-Yw4lMRPGJG@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-Yw4lMRPGJG@https.bugzilla.kernel.org/>
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

Yep. this looks like a real critical software and/or hardware bug. Like the one
you did show it the tomb raider vid.

If you could reproduce with a free game, that would be better for the amd devs.

I'll fool around a bit more with dirt rally (don't forget to restart the game each time
you change the settings...)

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
