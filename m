Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCvjBvQqgWlgEgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 23:53:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489BD281C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 23:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0501F10E3DE;
	Mon,  2 Feb 2026 22:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Daf+EW5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEAD10E129;
 Mon,  2 Feb 2026 22:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770072815; x=1801608815;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9jJkKSmHjIY4PvmTJDT7aV53FEqAwXGVXBEAlca9+SQ=;
 b=Daf+EW5ee0sG7P60biwHs6paL1kMHXr1dl+BK97FrPgVCgnwzTJdeSwc
 9qoyPA9nRNwJjdBc43cHCgh2KidVTxEkeE/idNWTwtJXwk64u0xqQIeMC
 kGhRd5hkcPYDcr5cFUe72pJiYP5930PlKBwG7PdhFZoPCrsYso21t9l/0
 Ra7tfl2B6K+XuyJ4YU0/sTt3LqdCHTw/jwoJh68ZsZVi2qgDbNLF+pYRE
 ypPj0V2LRDIfIomI78gbpc90se4kG//mgXuLKAN8YK2k6U4rJeK1KKKES
 Go1ZwtXmhFjFspp6vtQ0OOrXvO/iu/cjBpk6+uIJg/igBpj1II7U8viqy g==;
X-CSE-ConnectionGUID: S3rKOF+9QzubX2hNrTPIFQ==
X-CSE-MsgGUID: 2YU9P4wzTcm9dMlkQWmeRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70444692"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="70444692"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 14:53:34 -0800
X-CSE-ConnectionGUID: Op/gtPnQThup9+D+67l0kQ==
X-CSE-MsgGUID: Z6MA8XHuSTm3sPal1HjJbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209660424"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 02 Feb 2026 14:53:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vn2nN-00000000g24-3BAB;
 Mon, 02 Feb 2026 22:53:25 +0000
Date: Tue, 3 Feb 2026 06:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v5 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <202602030622.mmakbYmv-lkp@intel.com>
References: <20260202064356.286243-8-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202064356.286243-8-riana.tauro@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,linux.intel.com,intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,kernel.org,redhat.com,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url,gitlab.freedesktop.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: 7489BD281C
X-Rspamd-Action: no action

Hi Riana,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-misc/drm-misc-next drm/drm-next linus/master v6.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Riana-Tauro/drm-ras-Introduce-the-DRM-RAS-infrastructure-over-generic-netlink/20260202-141553
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260202064356.286243-8-riana.tauro%40intel.com
patch subject: [PATCH v5 1/5] drm/ras: Introduce the DRM RAS infrastructure over generic netlink
config: csky-randconfig-002-20260203 (https://download.01.org/0day-ci/archive/20260203/202602030622.mmakbYmv-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030622.mmakbYmv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030622.mmakbYmv-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nla_put_u32':
>> include/net/netlink.h:1459:(.text+0x12): undefined reference to `nla_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nla_put_string':
   include/net/netlink.h:1657:(.text+0x28): undefined reference to `nla_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nla_put_u32':
   include/net/netlink.h:1459:(.text+0x3a): undefined reference to `nla_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `drm_ras_node_unregister':
>> drivers/gpu/drm/drm_ras.c:350:(.text+0x10c): undefined reference to `nla_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `__genlmsg_iput':
>> include/net/genetlink.h:342:(.text+0x246): undefined reference to `genlmsg_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nla_put_u32':
   include/net/netlink.h:1459:(.text+0x262): undefined reference to `nla_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nla_put_string':
   include/net/netlink.h:1657:(.text+0x27e): undefined reference to `nla_put'
>> csky-linux-ld: include/net/netlink.h:1657:(.text+0x29a): undefined reference to `nla_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nla_put_u32':
   include/net/netlink.h:1459:(.text+0x2b6): undefined reference to `nla_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nlmsg_trim':
>> include/net/netlink.h:1108:(.text+0x2e4): undefined reference to `skb_trim'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `drm_ras_nl_list_nodes_dumpit':
>> drivers/gpu/drm/drm_ras.c:144:(.text+0x330): undefined reference to `genlmsg_put'
>> csky-linux-ld: drivers/gpu/drm/drm_ras.c:144:(.text+0x334): undefined reference to `nla_put'
>> csky-linux-ld: drivers/gpu/drm/drm_ras.c:144:(.text+0x344): undefined reference to `skb_trim'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `__genlmsg_iput':
   include/net/genetlink.h:342:(.text+0x408): undefined reference to `genlmsg_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nlmsg_trim':
   include/net/netlink.h:1108:(.text+0x45a): undefined reference to `skb_trim'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `alloc_skb':
>> include/linux/skbuff.h:1383:(.text+0x4f8): undefined reference to `__alloc_skb'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `__genlmsg_iput':
   include/net/genetlink.h:342:(.text+0x510): undefined reference to `genlmsg_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `kfree_skb_reason':
>> include/linux/skbuff.h:1322:(.text+0x51e): undefined reference to `sk_skb_reason_drop'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `doit_reply_value':
   drivers/gpu/drm/drm_ras.c:196:(.text+0x534): undefined reference to `genlmsg_put'
   csky-linux-ld: drivers/gpu/drm/drm_ras.c:196:(.text+0x544): undefined reference to `skb_trim'
>> csky-linux-ld: drivers/gpu/drm/drm_ras.c:196:(.text+0x548): undefined reference to `__alloc_skb'
>> csky-linux-ld: drivers/gpu/drm/drm_ras.c:196:(.text+0x54c): undefined reference to `sk_skb_reason_drop'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nlmsg_trim':
   include/net/netlink.h:1108:(.text+0x5a4): undefined reference to `skb_trim'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `kfree_skb_reason':
   include/linux/skbuff.h:1322:(.text+0x5b6): undefined reference to `sk_skb_reason_drop'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `nlmsg_unicast':
>> include/net/netlink.h:1198:(.text+0x5d6): undefined reference to `netlink_unicast'
   csky-linux-ld: drivers/gpu/drm/drm_ras.o: in function `drm_ras_nl_query_error_counter_doit':
>> drivers/gpu/drm/drm_ras.c:312:(.text+0x614): undefined reference to `skb_trim'
   csky-linux-ld: drivers/gpu/drm/drm_ras.c:312:(.text+0x618): undefined reference to `sk_skb_reason_drop'
>> csky-linux-ld: drivers/gpu/drm/drm_ras.c:312:(.text+0x61c): undefined reference to `init_net'
>> csky-linux-ld: drivers/gpu/drm/drm_ras.c:312:(.text+0x620): undefined reference to `netlink_unicast'
   csky-linux-ld: drivers/gpu/drm/drm_ras_genl_family.o: in function `drm_ras_genl_family_register':
>> drivers/gpu/drm/drm_ras_genl_family.c:23:(.text+0xa): undefined reference to `genl_register_family'
   csky-linux-ld: drivers/gpu/drm/drm_ras_genl_family.o: in function `drm_ras_genl_family_unregister':
>> drivers/gpu/drm/drm_ras_genl_family.c:39:(.text+0x4c): undefined reference to `genl_unregister_family'
>> csky-linux-ld: drivers/gpu/drm/drm_ras_genl_family.c:42:(.text+0x64): undefined reference to `genl_register_family'
>> csky-linux-ld: drivers/gpu/drm/drm_ras_genl_family.c:42:(.text+0x68): undefined reference to `genl_unregister_family'


vim +1459 include/net/netlink.h

24c410dce335db David S. Miller 2012-04-01  1448  
bfa83a9e03cf8d Thomas Graf     2005-11-10  1449  /**
bfa83a9e03cf8d Thomas Graf     2005-11-10  1450   * nla_put_u32 - Add a u32 netlink attribute to a socket buffer
bfa83a9e03cf8d Thomas Graf     2005-11-10  1451   * @skb: socket buffer to add attribute to
bfa83a9e03cf8d Thomas Graf     2005-11-10  1452   * @attrtype: attribute type
bfa83a9e03cf8d Thomas Graf     2005-11-10  1453   * @value: numeric value
bfa83a9e03cf8d Thomas Graf     2005-11-10  1454   */
bfa83a9e03cf8d Thomas Graf     2005-11-10  1455  static inline int nla_put_u32(struct sk_buff *skb, int attrtype, u32 value)
bfa83a9e03cf8d Thomas Graf     2005-11-10  1456  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1457  	u32 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1458  
b4391db42308c9 Arnd Bergmann   2017-09-22 @1459  	return nla_put(skb, attrtype, sizeof(u32), &tmp);
bfa83a9e03cf8d Thomas Graf     2005-11-10  1460  }
bfa83a9e03cf8d Thomas Graf     2005-11-10  1461  
374d345d9b5e13 Jakub Kicinski  2023-10-18  1462  /**
374d345d9b5e13 Jakub Kicinski  2023-10-18  1463   * nla_put_uint - Add a variable-size unsigned int to a socket buffer
374d345d9b5e13 Jakub Kicinski  2023-10-18  1464   * @skb: socket buffer to add attribute to
374d345d9b5e13 Jakub Kicinski  2023-10-18  1465   * @attrtype: attribute type
374d345d9b5e13 Jakub Kicinski  2023-10-18  1466   * @value: numeric value
374d345d9b5e13 Jakub Kicinski  2023-10-18  1467   */
374d345d9b5e13 Jakub Kicinski  2023-10-18  1468  static inline int nla_put_uint(struct sk_buff *skb, int attrtype, u64 value)
374d345d9b5e13 Jakub Kicinski  2023-10-18  1469  {
374d345d9b5e13 Jakub Kicinski  2023-10-18  1470  	u64 tmp64 = value;
374d345d9b5e13 Jakub Kicinski  2023-10-18  1471  	u32 tmp32 = value;
374d345d9b5e13 Jakub Kicinski  2023-10-18  1472  
374d345d9b5e13 Jakub Kicinski  2023-10-18  1473  	if (tmp64 == tmp32)
374d345d9b5e13 Jakub Kicinski  2023-10-18  1474  		return nla_put_u32(skb, attrtype, tmp32);
374d345d9b5e13 Jakub Kicinski  2023-10-18  1475  	return nla_put(skb, attrtype, sizeof(u64), &tmp64);
374d345d9b5e13 Jakub Kicinski  2023-10-18  1476  }
374d345d9b5e13 Jakub Kicinski  2023-10-18  1477  
bfa83a9e03cf8d Thomas Graf     2005-11-10  1478  /**
569a8fc38367df David S. Miller 2012-03-29  1479   * nla_put_be32 - Add a __be32 netlink attribute to a socket buffer
569a8fc38367df David S. Miller 2012-03-29  1480   * @skb: socket buffer to add attribute to
569a8fc38367df David S. Miller 2012-03-29  1481   * @attrtype: attribute type
569a8fc38367df David S. Miller 2012-03-29  1482   * @value: numeric value
569a8fc38367df David S. Miller 2012-03-29  1483   */
569a8fc38367df David S. Miller 2012-03-29  1484  static inline int nla_put_be32(struct sk_buff *skb, int attrtype, __be32 value)
569a8fc38367df David S. Miller 2012-03-29  1485  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1486  	__be32 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1487  
b4391db42308c9 Arnd Bergmann   2017-09-22  1488  	return nla_put(skb, attrtype, sizeof(__be32), &tmp);
569a8fc38367df David S. Miller 2012-03-29  1489  }
569a8fc38367df David S. Miller 2012-03-29  1490  
6c1dd3b6a35178 David S. Miller 2012-04-01  1491  /**
6c1dd3b6a35178 David S. Miller 2012-04-01  1492   * nla_put_net32 - Add 32-bit network byte order netlink attribute to a socket buffer
6c1dd3b6a35178 David S. Miller 2012-04-01  1493   * @skb: socket buffer to add attribute to
6c1dd3b6a35178 David S. Miller 2012-04-01  1494   * @attrtype: attribute type
6c1dd3b6a35178 David S. Miller 2012-04-01  1495   * @value: numeric value
6c1dd3b6a35178 David S. Miller 2012-04-01  1496   */
6c1dd3b6a35178 David S. Miller 2012-04-01  1497  static inline int nla_put_net32(struct sk_buff *skb, int attrtype, __be32 value)
6c1dd3b6a35178 David S. Miller 2012-04-01  1498  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1499  	__be32 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1500  
b4391db42308c9 Arnd Bergmann   2017-09-22  1501  	return nla_put_be32(skb, attrtype | NLA_F_NET_BYTEORDER, tmp);
6c1dd3b6a35178 David S. Miller 2012-04-01  1502  }
6c1dd3b6a35178 David S. Miller 2012-04-01  1503  
24c410dce335db David S. Miller 2012-04-01  1504  /**
24c410dce335db David S. Miller 2012-04-01  1505   * nla_put_le32 - Add a __le32 netlink attribute to a socket buffer
24c410dce335db David S. Miller 2012-04-01  1506   * @skb: socket buffer to add attribute to
24c410dce335db David S. Miller 2012-04-01  1507   * @attrtype: attribute type
24c410dce335db David S. Miller 2012-04-01  1508   * @value: numeric value
24c410dce335db David S. Miller 2012-04-01  1509   */
24c410dce335db David S. Miller 2012-04-01  1510  static inline int nla_put_le32(struct sk_buff *skb, int attrtype, __le32 value)
24c410dce335db David S. Miller 2012-04-01  1511  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1512  	__le32 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1513  
b4391db42308c9 Arnd Bergmann   2017-09-22  1514  	return nla_put(skb, attrtype, sizeof(__le32), &tmp);
24c410dce335db David S. Miller 2012-04-01  1515  }
24c410dce335db David S. Miller 2012-04-01  1516  
73520786b0793c Nicolas Dichtel 2016-04-22  1517  /**
73520786b0793c Nicolas Dichtel 2016-04-22  1518   * nla_put_u64_64bit - Add a u64 netlink attribute to a skb and align it
73520786b0793c Nicolas Dichtel 2016-04-22  1519   * @skb: socket buffer to add attribute to
73520786b0793c Nicolas Dichtel 2016-04-22  1520   * @attrtype: attribute type
73520786b0793c Nicolas Dichtel 2016-04-22  1521   * @value: numeric value
73520786b0793c Nicolas Dichtel 2016-04-22  1522   * @padattr: attribute type for the padding
73520786b0793c Nicolas Dichtel 2016-04-22  1523   */
73520786b0793c Nicolas Dichtel 2016-04-22  1524  static inline int nla_put_u64_64bit(struct sk_buff *skb, int attrtype,
73520786b0793c Nicolas Dichtel 2016-04-22  1525  				    u64 value, int padattr)
73520786b0793c Nicolas Dichtel 2016-04-22  1526  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1527  	u64 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1528  
b4391db42308c9 Arnd Bergmann   2017-09-22  1529  	return nla_put_64bit(skb, attrtype, sizeof(u64), &tmp, padattr);
73520786b0793c Nicolas Dichtel 2016-04-22  1530  }
73520786b0793c Nicolas Dichtel 2016-04-22  1531  
569a8fc38367df David S. Miller 2012-03-29  1532  /**
b46f6ded906ef0 Nicolas Dichtel 2016-04-22  1533   * nla_put_be64 - Add a __be64 netlink attribute to a socket buffer and align it
569a8fc38367df David S. Miller 2012-03-29  1534   * @skb: socket buffer to add attribute to
569a8fc38367df David S. Miller 2012-03-29  1535   * @attrtype: attribute type
569a8fc38367df David S. Miller 2012-03-29  1536   * @value: numeric value
b46f6ded906ef0 Nicolas Dichtel 2016-04-22  1537   * @padattr: attribute type for the padding
569a8fc38367df David S. Miller 2012-03-29  1538   */
b46f6ded906ef0 Nicolas Dichtel 2016-04-22  1539  static inline int nla_put_be64(struct sk_buff *skb, int attrtype, __be64 value,
b46f6ded906ef0 Nicolas Dichtel 2016-04-22  1540  			       int padattr)
569a8fc38367df David S. Miller 2012-03-29  1541  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1542  	__be64 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1543  
b4391db42308c9 Arnd Bergmann   2017-09-22  1544  	return nla_put_64bit(skb, attrtype, sizeof(__be64), &tmp, padattr);
569a8fc38367df David S. Miller 2012-03-29  1545  }
569a8fc38367df David S. Miller 2012-03-29  1546  
6c1dd3b6a35178 David S. Miller 2012-04-01  1547  /**
e9bbe898cbe89b Nicolas Dichtel 2016-04-22  1548   * nla_put_net64 - Add 64-bit network byte order nlattr to a skb and align it
6c1dd3b6a35178 David S. Miller 2012-04-01  1549   * @skb: socket buffer to add attribute to
6c1dd3b6a35178 David S. Miller 2012-04-01  1550   * @attrtype: attribute type
6c1dd3b6a35178 David S. Miller 2012-04-01  1551   * @value: numeric value
e9bbe898cbe89b Nicolas Dichtel 2016-04-22  1552   * @padattr: attribute type for the padding
6c1dd3b6a35178 David S. Miller 2012-04-01  1553   */
e9bbe898cbe89b Nicolas Dichtel 2016-04-22  1554  static inline int nla_put_net64(struct sk_buff *skb, int attrtype, __be64 value,
e9bbe898cbe89b Nicolas Dichtel 2016-04-22  1555  				int padattr)
6c1dd3b6a35178 David S. Miller 2012-04-01  1556  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1557  	__be64 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1558  
b4391db42308c9 Arnd Bergmann   2017-09-22  1559  	return nla_put_be64(skb, attrtype | NLA_F_NET_BYTEORDER, tmp,
e9bbe898cbe89b Nicolas Dichtel 2016-04-22  1560  			    padattr);
6c1dd3b6a35178 David S. Miller 2012-04-01  1561  }
6c1dd3b6a35178 David S. Miller 2012-04-01  1562  
24c410dce335db David S. Miller 2012-04-01  1563  /**
e7479122befd70 Nicolas Dichtel 2016-04-22  1564   * nla_put_le64 - Add a __le64 netlink attribute to a socket buffer and align it
24c410dce335db David S. Miller 2012-04-01  1565   * @skb: socket buffer to add attribute to
24c410dce335db David S. Miller 2012-04-01  1566   * @attrtype: attribute type
24c410dce335db David S. Miller 2012-04-01  1567   * @value: numeric value
e7479122befd70 Nicolas Dichtel 2016-04-22  1568   * @padattr: attribute type for the padding
24c410dce335db David S. Miller 2012-04-01  1569   */
e7479122befd70 Nicolas Dichtel 2016-04-22  1570  static inline int nla_put_le64(struct sk_buff *skb, int attrtype, __le64 value,
e7479122befd70 Nicolas Dichtel 2016-04-22  1571  			       int padattr)
24c410dce335db David S. Miller 2012-04-01  1572  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1573  	__le64 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1574  
b4391db42308c9 Arnd Bergmann   2017-09-22  1575  	return nla_put_64bit(skb, attrtype, sizeof(__le64), &tmp, padattr);
24c410dce335db David S. Miller 2012-04-01  1576  }
24c410dce335db David S. Miller 2012-04-01  1577  
4778e0be16c291 Jiri Pirko      2012-07-27  1578  /**
4778e0be16c291 Jiri Pirko      2012-07-27  1579   * nla_put_s8 - Add a s8 netlink attribute to a socket buffer
4778e0be16c291 Jiri Pirko      2012-07-27  1580   * @skb: socket buffer to add attribute to
4778e0be16c291 Jiri Pirko      2012-07-27  1581   * @attrtype: attribute type
4778e0be16c291 Jiri Pirko      2012-07-27  1582   * @value: numeric value
4778e0be16c291 Jiri Pirko      2012-07-27  1583   */
4778e0be16c291 Jiri Pirko      2012-07-27  1584  static inline int nla_put_s8(struct sk_buff *skb, int attrtype, s8 value)
4778e0be16c291 Jiri Pirko      2012-07-27  1585  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1586  	s8 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1587  
b4391db42308c9 Arnd Bergmann   2017-09-22  1588  	return nla_put(skb, attrtype, sizeof(s8), &tmp);
4778e0be16c291 Jiri Pirko      2012-07-27  1589  }
4778e0be16c291 Jiri Pirko      2012-07-27  1590  
4778e0be16c291 Jiri Pirko      2012-07-27  1591  /**
4778e0be16c291 Jiri Pirko      2012-07-27  1592   * nla_put_s16 - Add a s16 netlink attribute to a socket buffer
4778e0be16c291 Jiri Pirko      2012-07-27  1593   * @skb: socket buffer to add attribute to
4778e0be16c291 Jiri Pirko      2012-07-27  1594   * @attrtype: attribute type
4778e0be16c291 Jiri Pirko      2012-07-27  1595   * @value: numeric value
4778e0be16c291 Jiri Pirko      2012-07-27  1596   */
4778e0be16c291 Jiri Pirko      2012-07-27  1597  static inline int nla_put_s16(struct sk_buff *skb, int attrtype, s16 value)
4778e0be16c291 Jiri Pirko      2012-07-27  1598  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1599  	s16 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1600  
b4391db42308c9 Arnd Bergmann   2017-09-22  1601  	return nla_put(skb, attrtype, sizeof(s16), &tmp);
4778e0be16c291 Jiri Pirko      2012-07-27  1602  }
4778e0be16c291 Jiri Pirko      2012-07-27  1603  
4778e0be16c291 Jiri Pirko      2012-07-27  1604  /**
4778e0be16c291 Jiri Pirko      2012-07-27  1605   * nla_put_s32 - Add a s32 netlink attribute to a socket buffer
4778e0be16c291 Jiri Pirko      2012-07-27  1606   * @skb: socket buffer to add attribute to
4778e0be16c291 Jiri Pirko      2012-07-27  1607   * @attrtype: attribute type
4778e0be16c291 Jiri Pirko      2012-07-27  1608   * @value: numeric value
4778e0be16c291 Jiri Pirko      2012-07-27  1609   */
4778e0be16c291 Jiri Pirko      2012-07-27  1610  static inline int nla_put_s32(struct sk_buff *skb, int attrtype, s32 value)
4778e0be16c291 Jiri Pirko      2012-07-27  1611  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1612  	s32 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1613  
b4391db42308c9 Arnd Bergmann   2017-09-22  1614  	return nla_put(skb, attrtype, sizeof(s32), &tmp);
4778e0be16c291 Jiri Pirko      2012-07-27  1615  }
4778e0be16c291 Jiri Pirko      2012-07-27  1616  
4778e0be16c291 Jiri Pirko      2012-07-27  1617  /**
756a2f59b73cd6 Nicolas Dichtel 2016-04-22  1618   * nla_put_s64 - Add a s64 netlink attribute to a socket buffer and align it
4778e0be16c291 Jiri Pirko      2012-07-27  1619   * @skb: socket buffer to add attribute to
4778e0be16c291 Jiri Pirko      2012-07-27  1620   * @attrtype: attribute type
4778e0be16c291 Jiri Pirko      2012-07-27  1621   * @value: numeric value
756a2f59b73cd6 Nicolas Dichtel 2016-04-22  1622   * @padattr: attribute type for the padding
4778e0be16c291 Jiri Pirko      2012-07-27  1623   */
756a2f59b73cd6 Nicolas Dichtel 2016-04-22  1624  static inline int nla_put_s64(struct sk_buff *skb, int attrtype, s64 value,
756a2f59b73cd6 Nicolas Dichtel 2016-04-22  1625  			      int padattr)
4778e0be16c291 Jiri Pirko      2012-07-27  1626  {
b4391db42308c9 Arnd Bergmann   2017-09-22  1627  	s64 tmp = value;
b4391db42308c9 Arnd Bergmann   2017-09-22  1628  
b4391db42308c9 Arnd Bergmann   2017-09-22  1629  	return nla_put_64bit(skb, attrtype, sizeof(s64), &tmp, padattr);
4778e0be16c291 Jiri Pirko      2012-07-27  1630  }
4778e0be16c291 Jiri Pirko      2012-07-27  1631  
374d345d9b5e13 Jakub Kicinski  2023-10-18  1632  /**
374d345d9b5e13 Jakub Kicinski  2023-10-18  1633   * nla_put_sint - Add a variable-size signed int to a socket buffer
374d345d9b5e13 Jakub Kicinski  2023-10-18  1634   * @skb: socket buffer to add attribute to
374d345d9b5e13 Jakub Kicinski  2023-10-18  1635   * @attrtype: attribute type
374d345d9b5e13 Jakub Kicinski  2023-10-18  1636   * @value: numeric value
374d345d9b5e13 Jakub Kicinski  2023-10-18  1637   */
374d345d9b5e13 Jakub Kicinski  2023-10-18  1638  static inline int nla_put_sint(struct sk_buff *skb, int attrtype, s64 value)
374d345d9b5e13 Jakub Kicinski  2023-10-18  1639  {
374d345d9b5e13 Jakub Kicinski  2023-10-18  1640  	s64 tmp64 = value;
374d345d9b5e13 Jakub Kicinski  2023-10-18  1641  	s32 tmp32 = value;
374d345d9b5e13 Jakub Kicinski  2023-10-18  1642  
374d345d9b5e13 Jakub Kicinski  2023-10-18  1643  	if (tmp64 == tmp32)
374d345d9b5e13 Jakub Kicinski  2023-10-18  1644  		return nla_put_s32(skb, attrtype, tmp32);
374d345d9b5e13 Jakub Kicinski  2023-10-18  1645  	return nla_put(skb, attrtype, sizeof(s64), &tmp64);
374d345d9b5e13 Jakub Kicinski  2023-10-18  1646  }
374d345d9b5e13 Jakub Kicinski  2023-10-18  1647  
bfa83a9e03cf8d Thomas Graf     2005-11-10  1648  /**
bfa83a9e03cf8d Thomas Graf     2005-11-10  1649   * nla_put_string - Add a string netlink attribute to a socket buffer
bfa83a9e03cf8d Thomas Graf     2005-11-10  1650   * @skb: socket buffer to add attribute to
bfa83a9e03cf8d Thomas Graf     2005-11-10  1651   * @attrtype: attribute type
bfa83a9e03cf8d Thomas Graf     2005-11-10  1652   * @str: NUL terminated string
bfa83a9e03cf8d Thomas Graf     2005-11-10  1653   */
bfa83a9e03cf8d Thomas Graf     2005-11-10  1654  static inline int nla_put_string(struct sk_buff *skb, int attrtype,
bfa83a9e03cf8d Thomas Graf     2005-11-10  1655  				 const char *str)
bfa83a9e03cf8d Thomas Graf     2005-11-10  1656  {
bfa83a9e03cf8d Thomas Graf     2005-11-10 @1657  	return nla_put(skb, attrtype, strlen(str) + 1, str);
bfa83a9e03cf8d Thomas Graf     2005-11-10  1658  }
bfa83a9e03cf8d Thomas Graf     2005-11-10  1659  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
