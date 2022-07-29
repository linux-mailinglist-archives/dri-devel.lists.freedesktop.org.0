Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B1584C94
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 09:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6689D11B7B6;
	Fri, 29 Jul 2022 07:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFF210E101
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 06:51:49 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so4405827pjk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 23:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cjhKGepMlIEO3Wci9/3Wr5ru3tWGJp3cNdIthSMySCg=;
 b=US94Ex6+mIhfte+TqRog+s2Pf22KJc6EgYEaPm3/yUsb6/+DYws4WaXhwOUT5GvYPQ
 V92T+XmW89JigEKPMhesf2sLNaIfs8njwK4lMudM73HLb2oWIyjgOLu+Al8k1NSGP3sw
 Bc4/TB99oOjibAFHntXUclE1OJ2BWuJKWeGHUQMHObXkXv/jBmkrQ2u35JwD6PJedTvW
 mF+0s7zreMnnXEDUKqVM+peME7l8ECifPSAItc7v4z312/oS8NX/SwCfsmg0BKohTB2m
 XL+ZKcgoW1ED9fh+9y6mnlckLOz/+aUnBt/952jo36p7b2lTrLCD2VDvr+bCXTtXg4bs
 avgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cjhKGepMlIEO3Wci9/3Wr5ru3tWGJp3cNdIthSMySCg=;
 b=XLqf1lVVbCUL44LyeWN0sAq+0apGtPCcZ0LlkcoAuyMUMwzPXo+j67xy2y6PRgyDdH
 cNZHEfg22WvC94T7xzaNN4AtDppxFDjbmyBenzlI4kOr6eigGMBgbVZKzhdxgpYUecqf
 mPacIdS9gwQCnEBmHmdvbOf+DVvU20Ytah9zOSjPwLThSEWi4Kc/xN27sl8f7P0SgSk+
 Zvv7muGXaT+YW29Lr085VCWJlExm/Ue69ary8r7MbTKo9/pf3i4AzoEMlZFitTt5ea98
 0hf4x99q0vDGKAZMw0Ctb5sUCSRXVQVGAn+dpxUPQeba5MnQcSt5chtWHta63qEAUgGl
 cREw==
X-Gm-Message-State: ACgBeo0Gtc6GfU9k6H6lYv9i1TYNjBHO7sUVBWGAjsTGRrIWOCyBvnq1
 sdxQgKBnwI56pMaZvPRJJVJoerONYKpYaQ==
X-Google-Smtp-Source: AA6agR5SdBo50/7T8qs90kIzI/XxNgQSSDqRotzuwp+Yc5ZycTaAJ2WsuqUnVJtlvvd/f4FflqW/6A==
X-Received: by 2002:a17:90b:33c6:b0:1f3:2434:29c6 with SMTP id
 lk6-20020a17090b33c600b001f3243429c6mr3322066pjb.70.1659077509104; 
 Thu, 28 Jul 2022 23:51:49 -0700 (PDT)
Received: from fedora.. ([103.159.189.145]) by smtp.gmail.com with ESMTPSA id
 mg20-20020a17090b371400b001f30b100e04sm4989301pjb.15.2022.07.28.23.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 23:51:48 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] KASAN: vmalloc-out-of-bounds Write in imageblit (2)
Date: Fri, 29 Jul 2022 12:51:39 +0600
Message-Id: <20220729065139.6529-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <000000000000bbdd0405d120c155@google.com>
References: <000000000000bbdd0405d120c155@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Jul 2022 07:30:13 +0000
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

Here is a simplified reproducer for the issue:

https://gist.githubusercontent.com/Labnann/923d6b9b3a19848fc129637b839b8a55/raw/a68271fcc724569735fe27f80817e561b3ff629a/reproducer.c


