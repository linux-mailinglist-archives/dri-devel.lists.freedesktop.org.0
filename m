Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFAEA3C32
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 18:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C166E378;
	Fri, 30 Aug 2019 16:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5D86E378
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 16:40:07 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzaHaDUoSGC6_ESxTFWQxqgAZnDWzYNqx0zX17bv4KTUQ@mail.gmail.com>
References: <CAPM=9tzaHaDUoSGC6_ESxTFWQxqgAZnDWzYNqx0zX17bv4KTUQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzaHaDUoSGC6_ESxTFWQxqgAZnDWzYNqx0zX17bv4KTUQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-08-30
X-PR-Tracked-Commit-Id: 1c0d63eb0e824cb2916a77523ec7a4fa0e9753c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f69f199271ec5f765b056dfca703587d6d2b7aae
Message-Id: <156718320715.32023.8029988842983680256.pr-tracker-bot@kernel.org>
Date: Fri, 30 Aug 2019 16:40:07 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567183207;
 bh=RQpENOibGm538Vo2VFQB4mDCy6CplOCqcKnCCEE2qpc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=lj/tSXdxoz5HdDxhFuE2q8X+jlgnEI+HoucnDAwbWQW2nSSs5at036FQzmK8iaG62
 gNXccfBCqge/PRokeb2pTJ0qHLGtiTSejm30ZM01OXHFTO6QxFQ8lfiaBz1jOicfao
 /COFZRLofbvGRODFLii8uhJZ8bw3gmXf5evt2aks=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDMwIEF1ZyAyMDE5IDEzOjUxOjMxICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMDgtMzAKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jL2Y2OWYxOTkyNzFlYzVmNzY1YjA1NmRm
Y2E3MDM1ODdkNmQyYjdhYWUKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
