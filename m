Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D3BA4E11B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C2010E5F8;
	Tue,  4 Mar 2025 14:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oxJwVlpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BAB10E5FA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:36:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44681442FE;
 Tue,  4 Mar 2025 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741098995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OlI4pYP2rRQ0BJi3/bVqtCID19Cb9zPWADed9QQPtuE=;
 b=oxJwVlpA33ybk3fquxhR6LkD5wxclaWtz/Qhk19epmxmZjXrnOGLe7cJ5AA0lRQQEcKTaH
 3vZXPBsxKmglvHM4F9KqbB7wXLnHTCALRqVL040Kq06y8hcXctka/j/4OuYmmd23m+51rU
 RQgu8sVj+e5abiw5U3sS6+DLiw/iWjurx3RzWcQM9/ZKtqaHl12mC2SgKURHhrFTYRALHu
 BOmoS3Fh208QqKRs99DXcLk1ciU/jajChXJuQzeyu2mMrSXDOKe/rt2fvh5hdg9WjWBsl0
 cOkx9hCwmKxFmN5KskoMekTRNWD8afu8jITGJ6tX4bNpmo0ME8br1tn+xZz46w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 04 Mar 2025 15:36:30 +0100
Subject: [PATCH libdrm 2/2] modetest: Add color configuration for plain pattern
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-color-option-v1-2-be521604fbff@bootlin.com>
References: <20250304-color-option-v1-0-be521604fbff@bootlin.com>
In-Reply-To: <20250304-color-option-v1-0-be521604fbff@bootlin.com>
To: dri-devel@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4994;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=pKTPDvLW6awP7wRPgLyLAavNSfntx5I5sxb2I/VJR4c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnxw/ygbvbk33vefP3mj366JC+nmWgrXwyIA6mk
 pFJIS7g9hyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ8cP8gAKCRAgrS7GWxAs
 4ubsEACaKvDCFp7f8WRmhxfdHIDOmpcQVS+BXo4y4itbyAI1T1g02kaCO7XTu+faPn9T/60S64M
 UCM8/N60X32Pgu0hnq3b2BpzSx19decugcpYOlOhMFQALnBEa4XbOPtwOy7B5SmyCme+mho9//E
 yelf0aQk61kqZNs4I0IdVB447Xvg90Qsc0pkd/0T2mWdxdEY2Bk/purWcd+dWdhNDh4A7U+sNKC
 iVy03mI885DPaBzQQrjPGbpayrqpPmRIfQ1dePFqt6nSNxtCADZPz3r7EbbSD7sSi/b45hZY5gW
 KRCOKYBuymDIXJf01vZ18R1Nxs8o8yHNPrstACEIIYND49Hiy/yc4KDPGpoqKp+uEE7cL9s42Bs
 egLGRIa2pi/VPKnHaXFxPnc8xw8lBnV2YCfDojEnDcOkNNlrTbrrvSOafRCgLzpUbhhHvCWKGDt
 cNvr6i4bZzqNpw6+nTV6yFQ5ydWEO0fsKlkxvlDzmDNtpIDOC/Iq/4Pg6NNq1wz5u9UI0h+fjNq
 ua107CtWGDF0ycZWp2FkPBeOOzO1if4dWcczwupCDQP5yLv2p7wuqPdil4HeoftQYCmQpp2wqrC
 XEhQjWrq0jyXx7zxmnA1kZrvor2i3yPXQgTGuzTymJQ9K2FVKJiWZJ0h4cAWp3F+R9xhcG8ARxD
 iLEbWYvWjDVwvGg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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

The plain pattern is useful to debug display issues. Unfortunatly this
pattern is not configurable. Add a new option '-V' for this.

Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/modetest/buffers.c  |  5 +++--
 tests/modetest/buffers.h  |  3 ++-
 tests/modetest/modetest.c | 22 +++++++++++++++++-----
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index 03a6d424f102..328370ce2cfc 100644
--- a/tests/modetest/buffers.c
+++ b/tests/modetest/buffers.c
@@ -114,7 +114,8 @@ struct bo *
 bo_create(int fd, unsigned int format,
 	  unsigned int width, unsigned int height,
 	  unsigned int handles[4], unsigned int pitches[4],
-	  unsigned int offsets[4], enum util_fill_pattern pattern)
+	  unsigned int offsets[4], enum util_fill_pattern pattern,
+	  unsigned int color)
 {
 	unsigned int virtual_height, xsub, ysub;
 	struct bo *bo;
@@ -386,7 +387,7 @@ bo_create(int fd, unsigned int format,
 		break;
 	}
 
-	util_fill_pattern(format, pattern, 0x38383838, planes, width, height, pitches[0]);
+	util_fill_pattern(format, pattern, color, planes, width, height, pitches[0]);
 	bo_unmap(bo);
 
 	return bo;
diff --git a/tests/modetest/buffers.h b/tests/modetest/buffers.h
index cbd54e9ed386..3e2aa14796cb 100644
--- a/tests/modetest/buffers.h
+++ b/tests/modetest/buffers.h
@@ -34,7 +34,8 @@ struct bo;
 struct bo *bo_create(int fd, unsigned int format,
 		   unsigned int width, unsigned int height,
 		   unsigned int handles[4], unsigned int pitches[4],
-		   unsigned int offsets[4], enum util_fill_pattern pattern);
+		   unsigned int offsets[4], enum util_fill_pattern pattern,
+		   unsigned int color);
 void bo_destroy(struct bo *bo);
 void bo_dump(struct bo *bo, const char *filename);
 
diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index d9e761e6cfa0..d98fe3c98dfb 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -70,6 +70,7 @@
 
 static enum util_fill_pattern primary_fill = UTIL_PATTERN_SMPTE;
 static enum util_fill_pattern secondary_fill = UTIL_PATTERN_TILES;
+static unsigned long color = 0x308830;
 static drmModeModeInfo user_mode;
 
 struct crtc {
@@ -1199,7 +1200,7 @@ bo_fb_create(int fd, unsigned int fourcc, const uint32_t w, const uint32_t h,
 	struct bo *bo;
 	unsigned int fb_id;
 
-	bo = bo_create(fd, fourcc, w, h, handles, pitches, offsets, pat);
+	bo = bo_create(fd, fourcc, w, h, handles, pitches, offsets, pat, color);
 
 	if (bo == NULL)
 		return -1;
@@ -1240,7 +1241,7 @@ static int atomic_set_plane(struct device *dev, struct plane_arg *p,
 
 	if (!plane_bo) {
 		if (bo_fb_create(dev->fd, p->fourcc, p->w, p->h,
-                         pattern, &plane_bo, &p->fb_id))
+				 pattern, &plane_bo, &p->fb_id))
 			return -1;
 	}
 
@@ -1665,7 +1666,7 @@ static unsigned int set_mode(struct device *dev, struct pipe_arg **pipe_args, un
 		}
 
 		if (bo_fb_create(dev->fd, pipes[0].fourcc, dev->mode.width, dev->mode.height,
-			             primary_fill, &dev->mode.bo, &dev->mode.fb_id))
+				 primary_fill, &dev->mode.bo, &dev->mode.fb_id))
 			return 0;
 	}
 
@@ -1857,7 +1858,7 @@ static void set_cursors(struct device *dev, struct pipe_arg *pipes, unsigned int
 	 * translucent alpha
 	 */
 	bo = bo_create(dev->fd, DRM_FORMAT_ARGB8888, cw, ch, handles, pitches,
-		       offsets, UTIL_PATTERN_PLAIN);
+		       offsets, UTIL_PATTERN_PLAIN, color);
 	if (bo == NULL)
 		return;
 
@@ -2126,6 +2127,13 @@ static void parse_fill_patterns(char *arg)
 	secondary_fill = util_pattern_enum(fill);
 }
 
+static void parse_fill_value(char *arg)
+{
+	char *end;
+
+	color = strtoul(arg, &end, 16);
+}
+
 static void usage(char *name)
 {
 	fprintf(stderr, "usage: %s [-acDdefMoPpsCvrw]\n", name);
@@ -2149,6 +2157,7 @@ static void usage(char *name)
 	fprintf(stderr, "\t-w <obj_id>:<prop_name>:<value>\tset property, see 'property'\n");
 	fprintf(stderr, "\t-a \tuse atomic API\n");
 	fprintf(stderr, "\t-F pattern1,pattern2\tspecify fill patterns\n");
+	fprintf(stderr, "\t-V <RRGGBB hex value>\tspecify RGB hex color for plain pattern\n");
 	fprintf(stderr, "\t-o <desired file path> \t Dump writeback output buffer to file\n");
 
 	fprintf(stderr, "\n Generic options:\n\n");
@@ -2179,7 +2188,7 @@ static void usage(char *name)
 	exit(0);
 }
 
-static char optstr[] = "acdD:efF:M:P:ps:Cvrw:o:";
+static const char optstr[] = "acdD:efF:V:M:P:ps:Cvrw:o:";
 
 int main(int argc, char **argv)
 {
@@ -2236,6 +2245,9 @@ int main(int argc, char **argv)
 		case 'F':
 			parse_fill_patterns(optarg);
 			break;
+		case 'V':
+			parse_fill_value(optarg);
+			break;
 		case 'M':
 			module = optarg;
 			/* Preserve the default behaviour of dumping all information. */

-- 
2.48.1

