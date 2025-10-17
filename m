Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B56BEB66C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 21:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C603B10E195;
	Fri, 17 Oct 2025 19:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WOjYS/I2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823B10E191
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 19:46:46 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-33428befc5bso3139471a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 12:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760730406; x=1761335206;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mBvryYOqD8HNerZ7bT9XbtcCmI6RO+oIJ+KFZE+bBA4=;
 b=WOjYS/I27wLhVa5IeQT3pvYC2ax9j+8WdKkIhXlmkP9RZJyBPNLPc0jbtag0/q7+/M
 RJGxxn9VD1SrDJxQOaXqXfxPzss9YEfFxK3hiZyCMnuxjlwzCmF1oa4VRdr1ylBLu4MP
 0YxVPZ9s+0dGgUDfXP8N8pCrJhIP6IIZeQjHswlJ7uIgmq9dZRDzk7jIlg1tnFC3DBtx
 T39RR22T7VH10y+GMSsGexLRmYey5FYK+GCL2IqxY8FK4eyzwfwAoBiT82nBub8Qayv6
 dKCVFOD/EK4pHMNaWAfyRzSZg+dhjqVgfLDKib2JA4CRs7DzxDUwTSHGHIr/vucSGJ0B
 ROSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760730406; x=1761335206;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mBvryYOqD8HNerZ7bT9XbtcCmI6RO+oIJ+KFZE+bBA4=;
 b=tC92wfmnhA3mlZylq6yuqtqRnK0zXSmDBTpyoas6ZEV8q9tIgGV5DcsMIqVLhk6E1L
 cqn6dDKvqcN73rAVvLIOfoLz7zy+bbJzKIGMYYTbvUDPBav97yHUA7Hr+C8BnIVqOZGW
 MIRk0+CrzCwnxj91f5LgQF7Dv65hcB3v/TvA1VKSnP9RWDkFBpNUVe4phXFz67u1PtAD
 1ubvdh5U9kmiNWDhmyZE2QgrO6O+6C8YoZ10IpZzQ0mPpehQgtqkBGJ7SDQ3VAu5Ezf1
 CBdIyztGVh5bhdm2Q3coz0Abk1Nhl+tTvK6wdhqoCEWqpw/2d5Dl8W3SwRGJEtHgc05o
 p+8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk0bNWcwVws8y+4QVpopASlDtt3oeX/DpLHhN176oJB+6krO02WRziedTTRbxFBIr8z6geYy8RvTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypwzKcJ5ccz/vLoZ5yUztQJx0/CjobPKymAvtlSrZFK7nkKCrd
 u3nc+s5YxfZyHDJU7udqO66fqP9c/+IsOtSubx4Gu0tlPby8sVvSvuf37pf8lckjboDBVncjb+l
 zIH7J3Bf54fqLEg==
X-Google-Smtp-Source: AGHT+IHN5eE13thJaI4fJ62+yx8L8caLrQZjEIDPSPo5zSxYP+/52L85re73l0Onz4VuNANtIFfO6E2sXmQ60w==
X-Received: from pjbpt2.prod.google.com ([2002:a17:90b:3d02:b0:329:e84e:1c50])
 (user=ryanneph job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4cce:b0:32e:dd8c:dd18 with SMTP id
 98e67ed59e1d1-33bcf8f7617mr6720411a91.17.1760730406165; 
 Fri, 17 Oct 2025 12:46:46 -0700 (PDT)
Date: Fri, 17 Oct 2025 12:46:25 -0700
In-Reply-To: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
Mime-Version: 1.0
References: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
X-Developer-Key: i=ryanneph@google.com; a=openpgp;
 fpr=10046FDF459A0F9DD68C9C04313B8636EEDD116A
X-Developer-Signature: v=1; a=openpgp-sha256; l=6906; i=ryanneph@google.com;
 h=from:subject:message-id; bh=qYpzqLmT1kBqv90VharwV3lAsHtlLcSxlgG4fMUnBxQ=;
 b=owEBbQKS/ZANAwAKATE7hjbu3RFqAcsmYgBo8p0gsz8PKqAmdqM63Z99gXzQLW4CKPBnQ8A4B
 u4NrgJnkkCJAjMEAAEKAB0WIQQQBG/fRZoPndaMnAQxO4Y27t0RagUCaPKdIAAKCRAxO4Y27t0R
 asG9EACQ3Cpqge5fN+XA3VeDnHw2yu6AXwrxk+ijaZL+odai1bEifl4rGds5D4BxzhwYMzsxdEH
 orvNXnlF0L5X/p0XqWD2ax57Bq6kmSGJMBdAd9G78SfcEyBq/i2oLg7iHPZmnv4FP1LduS8j1uk
 l01R1tjriMmgVd1aGHtaYHRNl+4CcbGTRV07j8SV+mCorca44HtKv+u08pHpfovJOoirAmiqhIo
 KtcQr6FYXbedqzywvkufZucdTQU1nlqx6jhjkinJTYQgz1TZtLvYO7yxLoTjnjucMDcEIyVZT3P
 rDFFzVoo7qm4Qi35xiE9v6Csi41GD3WxVxcXbBxxBbvC2Ll/CSQELXjALDG5dtmsnZlG1t5oNyA
 cxz/NnG7UjqllOyZJv8x9dbVgnvBHcE8m01131o8sGmqWkXjl1XYhfbVDKCBVhVkTYk1vOVOUcp
 OEtnve1anbsKaECjb8QRm13vGXVBQT7RTgJ6KFg+/J35GCW6PlzSPu0IqmFlg66+hF/fBGxMyB1
 fU2lImGaG1w652ZDfTyK27U3+Mt/o+a6LrW4+Pta5BKw4Nisp9hXGhOF+fwFqcLIeuBCpDsAAEY
 tBl67PlKnTCZoEEP0SI1qFfdxbHeCHEUJWUP2ClVblpmUVooylpFcJa3+9C4BEagJNeS0nNtHsT
 MBZrq0by2cewCkg==
X-Mailer: b4 0.14.2
Message-ID: <20251017-rn-cfi-v1-1-bf66e6ad4fcd@google.com>
Subject: [PATCH 1/2] drm/xe/sysfs: Fix additional sysfs node access CFI
 violations
From: Ryan Neph <ryanneph@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ryan Neph <ryanneph@google.com>
Content-Type: text/plain; charset="utf-8"
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

Sysfs attribute store/show handlers expect the first passed parameter to
be of type 'struct kobject *', but Xe unintentionally abuses the fact
that a pointer to 'struct device' can decay to a kobject pointer (its
first member).

When CFI is enabled in the kernel, this is detected, resulting in an
intentional kernel crash when accessing the corresponding sysfs nodes.

This patch fixes the access handlers to take a kobject pointer instead
of device pointer, similarly to the earlier cleanup in
<https://lore.kernel.org/r/20250422171852.85558-1-jeevaka.badrappan@intel.com>
that missed some instances. Some others were added since with the same
issue.

Signed-off-by: Ryan Neph <ryanneph@google.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c        | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_survivability_mode.c | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_vram_freq.c          | 20 ++++++++++----------
 3 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62a1d0a051bbfd8698d4ec6de4d93e..6e7dc0c317f058e284203fc31dfed51f75e392ef 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -89,30 +89,30 @@ void xe_gt_apply_ccs_mode(struct xe_gt *gt)
 }
 
 static ssize_t
-num_cslices_show(struct device *kdev,
-		 struct device_attribute *attr, char *buf)
+num_cslices_show(struct kobject *kobj,
+		 struct kobj_attribute *attr, char *buf)
 {
-	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+	struct xe_gt *gt = kobj_to_gt(kobj);
 
 	return sysfs_emit(buf, "%u\n", hweight32(CCS_MASK(gt)));
 }
 
-static DEVICE_ATTR_RO(num_cslices);
+static struct kobj_attribute attr_num_cslices = __ATTR_RO(num_cslices);
 
 static ssize_t
-ccs_mode_show(struct device *kdev,
-	      struct device_attribute *attr, char *buf)
+ccs_mode_show(struct kobject *kobj,
+	      struct kobj_attribute *attr, char *buf)
 {
-	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+	struct xe_gt *gt = kobj_to_gt(kobj);
 
 	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
 }
 
 static ssize_t
-ccs_mode_store(struct device *kdev, struct device_attribute *attr,
+ccs_mode_store(struct kobject *kobj, struct kobj_attribute *attr,
 	       const char *buff, size_t count)
 {
-	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+	struct xe_gt *gt = kobj_to_gt(kobj);
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 num_engines, num_slices;
 	int ret;
@@ -158,11 +158,11 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR_RW(ccs_mode);
+static struct kobj_attribute attr_ccs_mode = __ATTR_RW(ccs_mode);
 
 static const struct attribute *gt_ccs_mode_attrs[] = {
-	&dev_attr_ccs_mode.attr,
-	&dev_attr_num_cslices.attr,
+	&attr_ccs_mode.attr,
+	&attr_num_cslices.attr,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 1662bfddd4bc9c530644c185eb929f0613eb8e30..8bfad28d269440deb6a18a95b91eccc61be1b50e 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -150,11 +150,11 @@ static int check_boot_failure(struct xe_device *xe)
 		survivability->boot_status == CRITICAL_FAILURE;
 }
 
-static ssize_t survivability_mode_show(struct device *dev,
-				       struct device_attribute *attr, char *buff)
+static ssize_t survivability_mode_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buff)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_survivability_info *info = survivability->info;
 	int index = 0, count = 0;
@@ -174,7 +174,8 @@ static ssize_t survivability_mode_show(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR_ADMIN_RO(survivability_mode);
+static struct kobj_attribute attr_survivability_mode =
+	__ATTR_RO_MODE(survivability_mode, 0400);
 
 static void xe_survivability_mode_fini(void *arg)
 {
@@ -182,7 +183,7 @@ static void xe_survivability_mode_fini(void *arg)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
-	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
+	sysfs_remove_file(&dev->kobj, &attr_survivability_mode.attr);
 }
 
 static int create_survivability_sysfs(struct pci_dev *pdev)
@@ -192,7 +193,7 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 	int ret;
 
 	/* create survivability mode sysfs */
-	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
+	ret = sysfs_create_file(&dev->kobj, &attr_survivability_mode.attr);
 	if (ret) {
 		dev_warn(dev, "Failed to create survivability sysfs files\n");
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 17bc84da4cdcc9da22f44b99f63f2393ad85371a..7c1ce2602f70abd3a00c03982b25a69bacc24a25 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -25,15 +25,15 @@
  *					configuration.
  */
 
-static struct xe_tile *dev_to_tile(struct device *dev)
+static struct xe_tile *kobj_parent_to_tile(struct kobject *kobj)
 {
-	return kobj_to_tile(dev->kobj.parent);
+	return kobj_to_tile(kobj->parent);
 }
 
-static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
+static ssize_t max_freq_show(struct kobject *kobj, struct kobj_attribute *attr,
 			     char *buf)
 {
-	struct xe_tile *tile = dev_to_tile(dev);
+	struct xe_tile *tile = kobj_parent_to_tile(kobj);
 	u32 val = 0, mbox;
 	int err;
 
@@ -50,12 +50,12 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
 
 	return sysfs_emit(buf, "%u\n", val);
 }
-static DEVICE_ATTR_RO(max_freq);
+static struct kobj_attribute attr_max_freq = __ATTR_RO(max_freq);
 
-static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
+static ssize_t min_freq_show(struct kobject *kobj, struct kobj_attribute *attr,
 			     char *buf)
 {
-	struct xe_tile *tile = dev_to_tile(dev);
+	struct xe_tile *tile = kobj_parent_to_tile(kobj);
 	u32 val = 0, mbox;
 	int err;
 
@@ -72,11 +72,11 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
 
 	return sysfs_emit(buf, "%u\n", val);
 }
-static DEVICE_ATTR_RO(min_freq);
+static struct kobj_attribute attr_min_freq = __ATTR_RO(min_freq);
 
 static struct attribute *freq_attrs[] = {
-	&dev_attr_max_freq.attr,
-	&dev_attr_min_freq.attr,
+	&attr_max_freq.attr,
+	&attr_min_freq.attr,
 	NULL
 };
 

-- 
2.51.0.858.gf9c4a03a3a-goog

