Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B145987F025
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 20:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD49810F864;
	Mon, 18 Mar 2024 19:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="IV5qgkfK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB68710F864
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 19:06:03 +0000 (UTC)
Message-ID: <6b44c9b7-e1e2-4b69-a443-4616ceab6f17@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710788761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aI53OR+8o+dtnjSJRsKHjwQWA3OPclhRJ779bxvtMIA=;
 b=IV5qgkfKSkQIYLWNQUflil6tfdnHRjp+RSS4A8Y6mtVmRh/JmXNI0eXK0Ru+4uPD61kQKz
 /RBKDMPWbuC8WIUZC82MvShrtpw5g2omWnjWt5FLLts5o5SdVBrpxFfCnibUlOZuWzXZiT
 d31TfX4l0nWmOpSjEtutiSfcvjs5fdw=
Date: Mon, 18 Mar 2024 15:05:57 -0400
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance
 testing
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kernel test robot <lkp@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240315230916.1759060-7-sean.anderson@linux.dev>
 <202403161704.ACHJdSJG-lkp@intel.com>
 <ce1190ad-27c2-4a16-b36f-442c0c419dcc@linux.dev>
 <20240318175032.GM13682@pendragon.ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20240318175032.GM13682@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 3/18/24 13:50, Laurent Pinchart wrote:
> On Mon, Mar 18, 2024 at 11:06:40AM -0400, Sean Anderson wrote:
>> On 3/16/24 06:14, kernel test robot wrote:
>> > Hi Sean,
>> > 
>> > kernel test robot noticed the following build warnings:
>> > 
>> > [auto build test WARNING on v6.8]
>> > [cannot apply to drm-misc/drm-misc-next linus/master next-20240315]
>> > [If your patch is applied to the wrong git tree, kindly drop us a note.
>> > And when submitting patch, we suggest to use '--base' as documented in
>> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
>> > 
>> > url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/drm-zynqmp_dp-Downgrade-log-level-for-aux-retries-message/20240316-071208
>> > base:   v6.8
>> > patch link:    https://lore.kernel.org/r/20240315230916.1759060-7-sean.anderson%40linux.dev
>> > patch subject: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance testing
>> > config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240316/202403161704.ACHJdSJG-lkp@intel.com/config)
>> > compiler: microblaze-linux-gcc (GCC) 13.2.0
>> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161704.ACHJdSJG-lkp@intel.com/reproduce)
>> > 
>> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202403161704.ACHJdSJG-lkp@intel.com/
>> > 
>> > All warnings (new ones prefixed by >>):
>> > 
>> >    drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_bridge_debugfs_init':
>> >>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2168:31: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
>> >     2168 |                 sprintf(name, fmt, i);
>> >          |                               ^~~
>> >    drivers/gpu/drm/xlnx/zynqmp_dp.c:2168:17: note: 'sprintf' output between 18 and 20 bytes into a destination of size 19
>> >     2168 |                 sprintf(name, fmt, i);
>> >          |                 ^~~~~~~~~~~~~~~~~~~~~
>> 
>> Not a bug, as i will be at most 4, which uses 1 digit.
> 
> The compiler can't know that. Please fix this, there's a zero warning
> policy.

I cannot reproduce this with GCC 13.2.0. So given that this is not a bug and I can't reproduce
it, I don't see how I can verify any fix.

--Sean

>> > vim +/sprintf +2168 drivers/gpu/drm/xlnx/zynqmp_dp.c
>> > 
>> >   2136	
>> >   2137	DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_rate, zynqmp_dp_rate_get,
>> >   2138				 zynqmp_dp_rate_set, "%llu\n");
>> >   2139	
>> >   2140	static void zynqmp_dp_bridge_debugfs_init(struct drm_bridge *bridge,
>> >   2141						  struct dentry *root)
>> >   2142	{
>> >   2143		struct zynqmp_dp *dp = bridge_to_dp(bridge);
>> >   2144		struct dentry *test;
>> >   2145		int i;
>> >   2146	
>> >   2147		dp->test.bw_code = DP_LINK_BW_5_4;
>> >   2148		dp->test.link_cnt = dp->num_lanes;
>> >   2149	
>> >   2150		test = debugfs_create_dir("test", root);
>> >   2151	#define CREATE_FILE(name) \
>> >   2152		debugfs_create_file(#name, 0600, test, dp, &fops_zynqmp_dp_##name)
>> >   2153		CREATE_FILE(pattern);
>> >   2154		CREATE_FILE(enhanced);
>> >   2155		CREATE_FILE(downspread);
>> >   2156		CREATE_FILE(active);
>> >   2157		CREATE_FILE(custom);
>> >   2158		CREATE_FILE(rate);
>> >   2159		CREATE_FILE(lanes);
>> >   2160	
>> >   2161		for (i = 0; i < dp->num_lanes; i++) {
>> >   2162			static const char fmt[] = "lane%d_preemphasis";
>> >   2163			char name[sizeof(fmt)];
>> >   2164	
>> >   2165			dp->debugfs_train_set[i].dp = dp;
>> >   2166			dp->debugfs_train_set[i].lane = i;
>> >   2167	
>> >> 2168			sprintf(name, fmt, i);
>> >   2169			debugfs_create_file(name, 0600, test,
>> >   2170					    &dp->debugfs_train_set[i],
>> >   2171					    &fops_zynqmp_dp_preemphasis);
>> >   2172	
>> >   2173			sprintf(name, "lane%d_swing", i);
>> >   2174			debugfs_create_file(name, 0600, test,
>> >   2175					    &dp->debugfs_train_set[i],
>> >   2176					    &fops_zynqmp_dp_swing);
>> >   2177		}
>> >   2178	}
>> >   2179	
> 

