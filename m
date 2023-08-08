Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB87736E2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 04:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BCD10E390;
	Tue,  8 Aug 2023 02:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0A110E390
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 02:43:39 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68730bafa6bso4092188b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 19:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691462618; x=1692067418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=INNxwX5OXvLNLDOBW649YAXFL5xD3rewmot3fGeUu+U=;
 b=A2/H7xZD3CqmMHtFxsVqnriGlaXy35N8gBbwRol4vGFZvKVXNjRJ4I2Ej91W89NYJM
 wSNrqUuSu0NHolUuyrAQOlT9CF2bWUVb0RRUmRd1vsjGH8JXqQUMDtKUCngxFdnfJqFN
 O4M6br26j+O/QUpWu/rrKJIXEuTHwWBeF8GT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691462618; x=1692067418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=INNxwX5OXvLNLDOBW649YAXFL5xD3rewmot3fGeUu+U=;
 b=B0k4YtlsjuxI6Rgpl1wz1JBxyxlPxrQjtUBVrohiLUOD1HTGNW0xJzuta46H66OGAK
 qwGuFOFQhOytaymEidqKz59gkBGX1f1ZguHATswWjJrvJ/Ug2RPhHfN5JgTd4X3stMZu
 JGMA/BWZWJomhg4dRlN1gSGncx1sn5tvZS9h41RUVmBh7hR4JfF5s1qqP+Wj6OXy5PWX
 7XFSiseVdgW1sNId+B0UBbjPznsdtY9HJO6qe91bOPoVgmj3TS1Z7Io/X6jquuKwp+Or
 le3Rz/cRtLpjk7nrUqoHM/4a3i9p+FkHjWD+HAshQpica3iBqQsbwXPd9Fjfz9G0mnRj
 jUTA==
X-Gm-Message-State: AOJu0YwBxtneLxyUwQZdLPcoY177kPcBLiIlk5bzBvIvZdwYPQiUuHzE
 ZPd3TII4Ibx6zdmJmA3bmESj4Q==
X-Google-Smtp-Source: AGHT+IEEHi3T6ZsjgaGRPluPDjQtcIdZ3It0oJBuq7pr5+R6rIUvnxra471DvdmsO6KuBdWwjldy+w==
X-Received: by 2002:a05:6a20:440a:b0:133:38cb:2b93 with SMTP id
 ce10-20020a056a20440a00b0013338cb2b93mr11291967pzb.9.1691462618594; 
 Mon, 07 Aug 2023 19:43:38 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 p23-20020aa78617000000b00662610cf7a8sm7063479pfn.172.2023.08.07.19.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 19:43:38 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: jshargo@chromium.org
Subject: 
Date: Tue,  8 Aug 2023 02:42:33 +0000
Message-ID: <20230808024313.2220391-2-brpol@chromium.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
In-Reply-To: <20230623222353.97283-1-jshargo@chromium.org>
References: <20230623222353.97283-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, mairacanal@riseup.net,
 mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Any progress on this?  Is it ok if yixie@chromium.org and I do the
followups on this patch so that we can also submit the Hotplug patch I
wrote (that's now archived?).


