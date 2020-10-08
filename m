Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D66287B79
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 20:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385EB6EAB6;
	Thu,  8 Oct 2020 18:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443776EAB6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 18:16:15 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id n9so4992695pgf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 11:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yKsi981vvwF+N+ZYhwgFUrN+CgUB1CwMs1aLx0H/cHw=;
 b=gNb4BprZFGA2owzXnIWMcRS1SGLB3YhJAatqvm8tOVuOo+BlQgZUrws4o0Vvk4XmY4
 IfzRsGkyBiFR1PNJm55k1Ab8YS70G8nkDkeaLpZBSQ0OXKQX5urm4v0pDQl67i39xe2F
 9mrX2n5JSUuXZSatT+ngc1RLQkeqo6SNSBKJB10cZ8Y9QIyE+JgpuCpbjoe903174Fhg
 BWEq5pvVSa4nnfPeodk3/b3SyPYlLiGoY7Fwisiou94NoPIkLBtDfIbIzq9I7/58YgI9
 uzMj+5YKDdkO4CJ0yVjkyLePREltNSBE9Rt3yyifVsGe5hINgcgAQ326ZJHdxI4bQa7Q
 Gfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yKsi981vvwF+N+ZYhwgFUrN+CgUB1CwMs1aLx0H/cHw=;
 b=kXbqg+GKQreUVpWmO4nIjbd49A1+umumdBNtd0h0sNodI0WIibeb8GR08JjDDWgOgJ
 mOAEKZsEo623pP9cXRfEFcX7c+QBo4YecWXyjTC0HjzSmozL/JYohbtwSCnt8ehRv4Nn
 Kceg9Ghit6w+Z4ooElKa3woRLr2r1A3NFuxhxIUlz7X72fAWETZz8ZRIXizvwoNhWZM4
 UMj7rVmu8MkZTWiHqNef38QdO1a7d3zzwSYqXGdkIhHRzJV4qs1QWY/BoX28rcK3BJMd
 5+U1UkGNp/ykwTTIA5SZweXNizSXw4VTB9rDugT0WEpgI5hKgfFqib9UG+cojdLvHB1+
 uPuA==
X-Gm-Message-State: AOAM531zgFN/+TklNUlFBrr1jexhgaHwPW1qJcNyNN96eVS+nw0X6iUr
 q0iE5VY6tt3mXdc4o6OSH1A=
X-Google-Smtp-Source: ABdhPJw0GJL49nMt+C1ANeM07A5CqK8b0nlUAthyvPRNL1leN4qtZ5ZY0IFjMKNgZU6PIp7L0zAoZg==
X-Received: by 2002:a17:90a:f187:: with SMTP id
 bv7mr125079pjb.198.1602180974607; 
 Thu, 08 Oct 2020 11:16:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.141.225])
 by smtp.gmail.com with ESMTPSA id u18sm8492491pgk.18.2020.10.08.11.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 11:16:13 -0700 (PDT)
From: sandy.8925@gmail.com
To: alexander.deucher@amd.com
Subject: 
Date: Thu,  8 Oct 2020 23:46:03 +0530
Message-Id: <20201008181606.460499-1-sandy.8925@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Sandeep Raghuraman <sandy.8925@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
