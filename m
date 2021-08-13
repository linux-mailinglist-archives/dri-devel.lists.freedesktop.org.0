Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF783EBA62
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 18:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96556E5D4;
	Fri, 13 Aug 2021 16:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mr85p00im-ztdg06011901.me.com (mr85p00im-ztdg06011901.me.com
 [17.58.23.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DA36E5D4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1628873432; bh=dz81L1ku3Hpe4E5OtuOFriXV6pn9rtMgL46TyiMQkaY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=E915KppUrDsrxbjMeENM1hQGuNZl9nj7eEP3TAxo7r/F1uiGII3/p0H1gpVBouieM
 NjquFRBuIWrDy+v9af7bgw5m2hz1gkdyeV8YdMnP6YGjydk6NNVG1WL/GeC98MAcJj
 SR/XSEMNop/3iLequ8ehbMsDlV7eUqzjQcp9kZupQnsNro0Xy1QcdFmGD+LE1EYSan
 RCTvS2sryqI3qmobiicjWqAEiLm/tF9GCWoN9P2liOrgt7wLolfjxHCazUHkzv4mY4
 e0+YdRDIFOcoqjqN+muR2xIvzs8EJ/R5WosQgAYEB0TA0cZnP+J7NaJqvyV/b6MnNH
 UZTtO5GVNnw9w==
Received: from stitch.danm.net (c-73-98-236-45.hsd1.ut.comcast.net
 [73.98.236.45])
 by mr85p00im-ztdg06011901.me.com (Postfix) with ESMTPSA id 10D9DA60312;
 Fri, 13 Aug 2021 16:50:31 +0000 (UTC)
From: Dan Moulding <dmoulding@me.com>
To: dmoulding@me.com
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jason@jlekstrand.net, ray.huang@amd.com
Subject: Re: [PATCH 0/1] Fix DRM driver initialization failure in kernel v5.14
Date: Fri, 13 Aug 2021 10:50:14 -0600
Message-Id: <20210813165014.31106-1-dmoulding@me.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810195906.22220-1-dmoulding@me.com>
References: <20210810195906.22220-1-dmoulding@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-08-13=5F05:2021-08-13=5F02,2021-08-13=5F05,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=708 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2108130101
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

Just a friendly reminder that this fix for a regression needs
review. It should be a quick review.

It would probably be good to ensure this gets in before the final 5.14
release, otherwise this is going to be a very visible regression for
anyone that uses DRM and does not use debugfs.

Thanks!

-- Dan
