Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A35320077
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 22:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6171D6EC1F;
	Fri, 19 Feb 2021 21:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09446EC20
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wY9mEXFe2P3a0UdkWqTDHpIbQAWcFhFpSw+CZuX2ZC4=;
 b=fFDXY2zxYZv82n6ezodZn0LldStheAJYNIx4ZW7JX7+YEYnmB4dLlt6u7lwPPT/VkoQ8q0
 1u5TrpO75LvnKnf/aEflSlTTnJBowkjILBQq9fwART8/YMk3PeXYbe+gf1SwmA3ZDpHKn+
 7cCK2e6HB7K7jpvj+jsOsLQesNZKjZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-8bqZ_ET2Ouy6p7BA7OKfog-1; Fri, 19 Feb 2021 16:53:57 -0500
X-MC-Unique: 8bqZ_ET2Ouy6p7BA7OKfog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73A13192FDB0;
 Fri, 19 Feb 2021 21:53:47 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9C0C6A03C;
 Fri, 19 Feb 2021 21:53:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/30] drm/dp: Fixup kernel docs for struct drm_dp_aux
Date: Fri, 19 Feb 2021 16:52:58 -0500
Message-Id: <20210219215326.2227596-3-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Make sure that struct members are referred to using @, otherwise they
  won't be formatted as such
* Make sure to refer to other struct types using & so they link back to
  each struct's definition
* Make sure to precede constant values with % so they're formatted
  correctly

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/drm/drm_dp_helper.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 2891a98eebc8..b35a1c1339e8 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1839,28 +1839,28 @@ struct drm_dp_aux_cec {
  * @crc_count: counter of captured frame CRCs
  * @transfer: transfers a message representing a single AUX transaction
  *
- * The .dev field should be set to a pointer to the device that implements the AUX channel.
+ * The @dev field should be set to a pointer to the device that implements the AUX channel.
  *
- * The .name field may be used to specify the name of the I2C adapter. If set to NULL, dev_name() of
- * .dev will be used.
+ * The @name field may be used to specify the name of the I2C adapter. If set to %NULL, dev_name()
+ * of @dev will be used.
  *
  * Drivers provide a hardware-specific implementation of how transactions are executed via the
- * .transfer() function. A pointer to a drm_dp_aux_msg structure describing the transaction is
+ * @transfer() function. A pointer to a &drm_dp_aux_msg structure describing the transaction is
  * passed into this function. Upon success, the implementation should return the number of payload
  * bytes that were transferred, or a negative error-code on failure. Helpers propagate errors from
- * the .transfer() function, with the exception of the -EBUSY error, which causes a transaction to
- * be retried. On a short, helpers will return -EPROTO to make it simpler to check for failure.
+ * the @transfer() function, with the exception of the %-EBUSY error, which causes a transaction to
+ * be retried. On a short, helpers will return %-EPROTO to make it simpler to check for failure.
  *
  * An AUX channel can also be used to transport I2C messages to a sink. A typical application of
- * that is to access an EDID that's present in the sink device. The .transfer() function can also be
+ * that is to access an EDID that's present in the sink device. The @transfer() function can also be
  * used to execute such transactions. The drm_dp_aux_register() function registers an I2C adapter
  * that can be passed to drm_probe_ddc(). Upon removal, drivers should call drm_dp_aux_unregister()
  * to remove the I2C adapter. The I2C adapter uses long transfers by default; if a partial response
  * is received, the adapter will drop down to the size given by the partial response for this
  * transaction only.
  *
- * Note that the aux helper code assumes that the .transfer() function only modifies the reply field
- * of the drm_dp_aux_msg structure. The retry logic and i2c helpers assume this is the case.
+ * Note that the aux helper code assumes that the @transfer() function only modifies the reply field
+ * of the &drm_dp_aux_msg structure. The retry logic and i2c helpers assume this is the case.
  */
 struct drm_dp_aux {
 	const char *name;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
