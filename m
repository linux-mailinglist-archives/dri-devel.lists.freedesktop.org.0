Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10816597D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8DA6ECEE;
	Thu, 20 Feb 2020 08:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FE16EC65
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:09:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z5so830710lfd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BzO//zfGvvmDXWFrnnBIQSHTy0ns1CXRccR7GcbPRlo=;
 b=JUP4ZDsbz/nmLgQNFKk7ZZas36mU5d/63thVdthtw/+JDzFZLmm9Vj+mqjzrSmschw
 YeksJAFYmxokDcgysmGHTfXsO1dvAp4X3RkAM/LTau78Zl4JXaagptPoIM5sLuCnoR1/
 6SVcUuwkb3URjB/vNyQs+ScYqRbjB5A3ZvCVU/WNFaQ6AZbCIuvu/d7zFsR+CHemuo/1
 /J0m3A2dlLsN9LGRdWNnJLdcnekETD9HMfDuuRkUH/8KVdzir+9mXlGmaigPhZfexv3Q
 kWqGXwKbEA1h1pOGvwi+PSsa885Ip0sRniQ8kS6jEBG7R1m3tD4vphMjWc3mC25hkdzu
 /uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BzO//zfGvvmDXWFrnnBIQSHTy0ns1CXRccR7GcbPRlo=;
 b=FIlSRAB8NBFXJ/4h7nxJmZ8/rkCTeMTv5C8QPjR4Jk6l3UJGlZdeDB3W0JLHyAXRWM
 aBxwEKoEdlv2Pa0hEOcNN5i8ZnmCiyCLs3Q22n8mFjuippRKve+Jl2O9HNXxilHwaFW0
 yeKQH20Rt1NSRWmsgzd0zMCtW6Kbn1+/C19FhtNuB1jJm9P/LydHGE9e9JrUGGeGhhRk
 ovQw0004LifDYz6lS0sKMyBvql4Muk1pypZFQj962JFzrndUOlGr13DE58mjBoeZ7ErQ
 mte90ZtigAp7ksvU39i4wGKNETjIz9esXZYlUTtF6YrIsoFyuoG7TFbnUstDQsveKSgF
 L/Ww==
X-Gm-Message-State: APjAAAUQ1PfWcBcRyPj1x7BU89+NU873TfG16/hMmox+wdQip3N8Lt+1
 aBitIMo1RbQbuTEHvl918HK7GHpGzmSHqg==
X-Google-Smtp-Source: APXvYqx/ns6qi730SvnAx7FkLa5GwKNXVqSyJ3M9ldEtC/E9MqH1QWbqSJudFSiqcFW6FXpQjYj21w==
X-Received: by 2002:ac2:5596:: with SMTP id v22mr14129478lfg.200.1582135797136; 
 Wed, 19 Feb 2020 10:09:57 -0800 (PST)
Received: from localhost.localdomain ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id 14sm183942lfz.47.2020.02.19.10.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 10:09:56 -0800 (PST)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: PATCH v4
Date: Wed, 19 Feb 2020 20:08:53 +0200
Message-Id: <20200219180858.4806-1-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200210195633.GA21832@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Cc: linux-sunxi@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Address all outstanding review comments.

Maxime, please confirm I've got "document the new
compatibles" part right.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
