Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA415A94BF6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 06:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9435710E06F;
	Mon, 21 Apr 2025 04:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="Sed5dPDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97D510E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 04:26:36 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7c922169051so141771685a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 21:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1745209595; x=1745814395;
 darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qLXMwjq74bNK6BOfgJ7phL0lyY08ZAolUu+OAsiQ9to=;
 b=Sed5dPDwTalqubrsZZwaeeUV+Ou+zdHxTN7k4qppuX/6JLV4OMCwD2PJZJVXsVf38U
 4tOXoIvHQuvHCvH+uW4+8KNOEiVWzA4CfRtDW3dd37zoOtXblOWlTJZPauvGAs4nEvGz
 7QTmDTq9LTGjbqngNhExhAtdBO2WeSiCCOXNtvHZ5N+l/RIvw5p9s17A34r4d27s4Hfd
 KAyF5I3uJWDsujev1686g660btHtCx4K5jvggXwfulNI77D/w+X9v72AXxya10urd3Jb
 aF5uyKgN1bTuntHm/ZR0PcyR9zIPUziJJoMDxby+PQeFFfV4J/d5uF8ucQv4gy1WxPzb
 E6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745209595; x=1745814395;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qLXMwjq74bNK6BOfgJ7phL0lyY08ZAolUu+OAsiQ9to=;
 b=ORYobQ0mRM6Ho4Sa9H7eZIfpX5mD3APvvSe1RXQ8aZFW5HozvrXuV/ynJL5GLoosZV
 +GsKDgOXRIFtwxwddiVLZa5JdrRLvSRF4lQvuiHgmnB/SPEz6wGR+B54Ln/szdioKZe0
 4xn8zmQ9Pu/j+Ip0DntkNB8QXa+pXaEHSBRaoAv4H5z5fuBqo12rZqIXtjpynuyHxHr7
 gPaq6vcszEk6egaOdFbu9L7pXruwME5rNqmLa6QvC/gAIp/QpEF+dM5EJ7rZ0Cd46b0E
 1OI+Q19gP74S7XtomKITZR1OqVp4MW9LrhCzcDfc3yMrIOswHkqc34q9lCVWSyYSlhnf
 t9LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqefKn45j5drAVb4hfpqImqQ961juzNLIfEQ8D4YIC1nGu96J1IUy4Lyx8p1VFu2yorT7kjktHtPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKZcqmpWZoLyatkcbNk2iECIWy63rSbzAh6/1uvuwujjKD1Ir7
 J5r7kGSIyQ04As2MQBokvPaSHlkCddzI9R0Ftdn7sPyTingzlzjsYdJ1jghLskY=
X-Gm-Gg: ASbGncs9CCEfDZqcdP2TNo6ZtHUtygCQU6LLeGx4Cgj5NhU/qvPVbR9QS6DhYxzLZCw
 Q4dCCYW2xVWu053F+NUtyTHGO6RxY7kg3nhFY2jBtcIk+z8Y8uyz0O25R4V/qjVqindOEMw+e7X
 jOYujmk30l2xPRPWBgfs+o4A1mbTzASFTRLzpsiaytlLukE5xmadijJe4m+rEOlK5pPhQ6DSlHA
 hp3WLLDSlCMF7g0TiSX2CWJjRAFe1+imuxOENUM88YuMnoSS1rU//UZuIUKwv+8zsWAA2Lmwhe1
 AXvhV8Zs3TrGQJDWUs4SiUcRdyaEKOS3x6ZZYJjX0W3yWXIWE1D59Ebk1xNy5Tbh7ejz2g==
X-Google-Smtp-Source: AGHT+IH3TnmhAg1TTlz4bLDFMIRiDBWG/0r9tsSd+aOYXwB1Hw87ZxRvl3foghRcH3dPlVidUnuInA==
X-Received: by 2002:a05:620a:1a89:b0:7c5:3d60:7f88 with SMTP id
 af79cd13be357-7c927f776d0mr1265005885a.16.1745209595407; 
 Sun, 20 Apr 2025 21:26:35 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c925b4dc09sm380262485a.73.2025.04.20.21.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Apr 2025 21:26:35 -0700 (PDT)
Date: Mon, 21 Apr 2025 00:26:33 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 regressions@lists.linux.dev
Cc: Douglas Anderson <dianders@chromium.org>
Subject: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi,

I recently noticed that on current kernels I lose video output from
my Blackbird's AST2500 BMC after a reboot, which makes it difficult to
boot the system again (the video output will come on only after Linux
is booted again).

With Linux 6.6 and earlier, there is no problem rebooting, everything
is fine.

I bisected to this commit:

  ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
  commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
  Author: Douglas Anderson <dianders@chromium.org>
  Date:   Fri Sep 1 16:39:53 2023 -0700

      drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers

This commit does not revert cleanly on 6.14, but I can easily undo
the changes this commit made to the ast driver, and this is enough
to restore working behaviour.

Let me know if you need any more info!

Thanks,
  Nick
