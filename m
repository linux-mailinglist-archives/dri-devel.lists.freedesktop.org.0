Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCB8ABB891
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971B810E2E2;
	Mon, 19 May 2025 09:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1D6B10E302
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:50 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-f6-682af77082b9
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v16 35/42] i2c: rename wait_for_completion callback to
 wait_for_completion_cb
Date: Mon, 19 May 2025 18:18:19 +0900
Message-Id: <20250519091826.19752-36-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0xTdxTH/f3uq63UXTuid6hxaaIi22Qsak50GjXG3Swh2aYx6iKukRvb
 WSprFYpxC9jKEISgiKSKUIopCGXWW0zUUaw0gIypdRYoDNkgvnhHpBUUH4XNf04+Od/H+edI
 CMUtKkqi0R0U9DqVVknLSNlwRNlnP72IUX/eWBwBwfEsEoovOWjw/VaNwFGbgaG/8SvoCA0h
 eHX7LgFFhT4EZb0PCKht6kHgrjxKw/2Hc8AfHKWhpTCHBlP5JRruDU5h6D5zCkO1GA//2B+T
 0Jpvw1DUT8O5IhMOj6cYJu1VDNjTl0Bf5VkGpnrjoKWnnQJ31ydgKemmoc7dQkLT1T4M968X
 09DjeEtBa9MtEkJ5C8B3MpeCmhEbDYMhOwH24CgDf3msGJqs88BpDhdmPn9DQXOuB0PmhcsY
 /J2/I6jP+heD6GinwRscwuASCwl4WdGIoC9vmIFjJyYZOJeRhyDn2BkSzN2r4NVE+PL58TjI
 KHWSUPO6HW1YxztKHIj3Do0SvNmVyr8MttG8O2Ql+T9sHH/t7AOGN9d3MbxVPMS7KmP48rp+
 zJeNBSlerDpO8+LYKYbPHvZjfuTOHeabhbtkXyYKWk2KoI9d/4NMPdjvoJJrOGOzw4bTUW9k
 NpJKOHYlZ2q8iN9zqb+QmGaaXcYFApMzHMl+zLlyH1PZSCYh2PbZXMf5TjQtfMju5p7da54x
 kewSznv0LjPNcnY198RX+n/pYq7a6ZnxSMP7rhzvTFbBruL81SXkdCnHFkg5598m+r/AR9zN
 ygCZj+RWNKsKKTS6lCSVRrtyhTpNpzGu2HsgSUTh/7L/PPX9VTTm29qAWAlSRsid7uVqBaVK
 MaQlNSBOQigj5VWuaLVCnqhKOyzoD+zRH9IKhga0QEIq58u/CKUmKth9qoPCfkFIFvTvVSyR
 RqUj3ZwjBZbAni1/fvDdpv3ygSO3PfPnbZ+wmKUDsRXFgYnoC22f3oiyJOfXfbvWrIK56R7D
 6eePXpw8cX3HwrTD4rgm0r38SX18hrYu/lHW2skWG3NN9HYaC0Z/XfT6686tS38xrttmii2/
 kjr75oaEvZk7jZsjsgZCP65xDz5rtWwcSZilJA1qVVwMoTeo3gE448iHWwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa1CMcRTG/f/vtdWa11p51bgtTamRmhHHdXzr1cT44DLCZId37E4Xza4i
 l1HaXEqhma1Bl63MyraR3T6E1qQdZRlZ2lKpqDFIEWlTyWXL+HLmN+d5zvN8OSwhM1G+rDrh
 sKhJUMYpaAkp2bI2fVnijyBVaNOFAHAPnyOh4LaZBuetCgTm6jQMfY8i4NXIAIKfz54TkK93
 Iijp6SKguqEbga38NA3N72aAyz1Ig0OfRUN62W0aXvRPYOjMy8VQYdkMb4zvSXh6qRRDfh8N
 1/LTsWd8xDBmNDFgTPWH3vKrDEz0hIGju5UCe6GDAltHMFwp6qSh1uYgoaGmF0PzvQIaus1/
 KHja8JiEkRw/cF7OpqDySykN/SNGAozuQQZe1hkwNBh8oErnST3z/TcFjdl1GM5cv4PB1X4f
 wYNzbzFYzK002N0DGKwWPQHjNx4h6M35zEDGhTEGrqXlIMjKyCNB1xkOP0c9zYXDYZBWXEVC
 5a9WtHGDYC4yI8E+MEgIOusRYdzdQgu2EQMpPCnlhbtXuxhB96CDEQyWJMFaHiSU1fZhoWTI
 TQkW03lasAzlMkLmZxcWvjQ1MVvnRUvWHRDj1MmiZvmGfRJVf5+ZSqzkjzaaS3Eq6pFnIi+W
 51bwxS49Mck0F8C3tY1NsZxbyFuz31OZSMISXOt0/lVhO5oUZnF7+W8vGqdMJOfP208/ZyZZ
 yq3kPziL8b/QBXxFVd2Ux8uz78iyT93KuHDeVVFEXkISA5pmQnJ1QnK8Uh0XHqKNVaUkqI+G
 7D8Ub0GeDzKenLhcg4abI+oRxyKFt7TKtlQlo5TJ2pT4esSzhEIuNVkDVTLpAWXKMVFzKEaT
 FCdq65EfSyrmSCN3ivtk3EHlYTFWFBNFzX8Vs16+qUjTHcDUtjijt5/N3ePqmhv1y2f9sqKQ
 FnXwqa0Zvar9frMLZraN4ehF24jIJbsND98GPbayu6KW30zRB/oONeZdX7jjviQmdPXX8tCo
 e3PQ/BPbN6V9ynW9Hm+PmObw9ufVwfKSu8dXBa4pU2i3RCoX5Okc6YMto0k+SYvV3qPVsRcV
 pFalDAsiNFrlX+hP++A9AwAA
X-CFilter-Loop: Reflected
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

Functionally no change.  This patch is a preparation for DEPT(DEPendency
Tracker) to track dependencies related to a scheduler API,
wait_for_completion().

Unfortunately, struct i2c_algo_pca_data has a callback member named
wait_for_completion, that is the same as the scheduler API, which makes
it hard to change the scheduler API to a macro form because of the
ambiguity.

Add a postfix _cb to the callback member to remove the ambiguity.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/i2c/algos/i2c-algo-pca.c      | 2 +-
 drivers/i2c/busses/i2c-pca-isa.c      | 2 +-
 drivers/i2c/busses/i2c-pca-platform.c | 2 +-
 include/linux/i2c-algo-pca.h          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
index 384af88e58ad..3647e4e19360 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -30,7 +30,7 @@ static int i2c_debug;
 #define pca_clock(adap) adap->i2c_clock
 #define pca_set_con(adap, val) pca_outw(adap, I2C_PCA_CON, val)
 #define pca_get_con(adap) pca_inw(adap, I2C_PCA_CON)
-#define pca_wait(adap) adap->wait_for_completion(adap->data)
+#define pca_wait(adap) adap->wait_for_completion_cb(adap->data)
 
 static void pca_reset(struct i2c_algo_pca_data *adap)
 {
diff --git a/drivers/i2c/busses/i2c-pca-isa.c b/drivers/i2c/busses/i2c-pca-isa.c
index 85e8cf58e8bf..0cbf2f509527 100644
--- a/drivers/i2c/busses/i2c-pca-isa.c
+++ b/drivers/i2c/busses/i2c-pca-isa.c
@@ -95,7 +95,7 @@ static struct i2c_algo_pca_data pca_isa_data = {
 	/* .data intentionally left NULL, not needed with ISA */
 	.write_byte		= pca_isa_writebyte,
 	.read_byte		= pca_isa_readbyte,
-	.wait_for_completion	= pca_isa_waitforcompletion,
+	.wait_for_completion_cb	= pca_isa_waitforcompletion,
 	.reset_chip		= pca_isa_resetchip,
 };
 
diff --git a/drivers/i2c/busses/i2c-pca-platform.c b/drivers/i2c/busses/i2c-pca-platform.c
index 87da8241b927..c0f35ebbe37d 100644
--- a/drivers/i2c/busses/i2c-pca-platform.c
+++ b/drivers/i2c/busses/i2c-pca-platform.c
@@ -180,7 +180,7 @@ static int i2c_pca_pf_probe(struct platform_device *pdev)
 	}
 
 	i2c->algo_data.data = i2c;
-	i2c->algo_data.wait_for_completion = i2c_pca_pf_waitforcompletion;
+	i2c->algo_data.wait_for_completion_cb = i2c_pca_pf_waitforcompletion;
 	if (i2c->gpio)
 		i2c->algo_data.reset_chip = i2c_pca_pf_resetchip;
 	else
diff --git a/include/linux/i2c-algo-pca.h b/include/linux/i2c-algo-pca.h
index 7c522fdd9ea7..e305bf32e40a 100644
--- a/include/linux/i2c-algo-pca.h
+++ b/include/linux/i2c-algo-pca.h
@@ -71,7 +71,7 @@ struct i2c_algo_pca_data {
 	void 				*data;	/* private low level data */
 	void (*write_byte)		(void *data, int reg, int val);
 	int  (*read_byte)		(void *data, int reg);
-	int  (*wait_for_completion)	(void *data);
+	int  (*wait_for_completion_cb)	(void *data);
 	void (*reset_chip)		(void *data);
 	/* For PCA9564, use one of the predefined frequencies:
 	 * 330000, 288000, 217000, 146000, 88000, 59000, 44000, 36000
-- 
2.17.1

