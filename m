Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359EEAC0386
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B724010FD87;
	Thu, 22 May 2025 04:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLYrpJ3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F99710E887
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 04:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747888021; x=1779424021;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pYPqpCs+wZJ2se/dDYL6AzIqkv5JEmLumwWmmFC+BEk=;
 b=KLYrpJ3vN3ZGmEfFyBRrnqvGDbOLJx8EhCSzMORzpQ2xmqup7IfsoGH7
 MtewPAH4a6SFyaSsy8IK2UHlj3NtRRYNAhmljqD85ZLcbltRu2B5efeFt
 fZiFbNedZ4q1reZaDQBCjrRBvyCY1wbD0H/MLfClZ5tAD27TtXcJffhXU
 bnOnD/ugWPGMyrHtYta73szZLcj8r+qutuMKeflf1XXftnMT2/hi05Iu7
 K+BVQHnMj58f+tIpKyTBQKWgDmYUBFhkoyIpuKQJ+tQpDSi1j/c/gJjsR
 tshF7qdn5kuEQ+Kll1BWjqFXR6XdNSrricxzXpLsencqSfZRJU+nMSOot Q==;
X-CSE-ConnectionGUID: uifuabhmQBeNXJnMU/FOuQ==
X-CSE-MsgGUID: PunM+OxdSE+lX3s6Kmg0cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="37513946"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="37513946"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 21:27:00 -0700
X-CSE-ConnectionGUID: 8O9WDd3fSp+bh4VeJDLIbA==
X-CSE-MsgGUID: 9l6/JDfuTBK4xlf7CvUNrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="145265186"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 21 May 2025 21:26:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uHxWA-000OuK-2V;
 Thu, 22 May 2025 04:26:54 +0000
Date: Thu, 22 May 2025 12:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hugo Villeneuve <hugo@hugovil.com>, biju.das.jz@bp.renesas.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 hugo@hugovil.com, Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH 1/2] drm: rcar-du: rzg2l_mipi_dsi: Implement host transfers
Message-ID: <202505221231.A6G8HqGd-lkp@intel.com>
References: <20250520171034.3488482-2-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520171034.3488482-2-hugo@hugovil.com>
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

Hi Hugo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7c1a9408ce5f34ded5a85db81cf80e0975901685]

url:    https://github.com/intel-lab-lkp/linux/commits/Hugo-Villeneuve/drm-rcar-du-rzg2l_mipi_dsi-Implement-host-transfers/20250521-011613
base:   7c1a9408ce5f34ded5a85db81cf80e0975901685
patch link:    https://lore.kernel.org/r/20250520171034.3488482-2-hugo%40hugovil.com
patch subject: [PATCH 1/2] drm: rcar-du: rzg2l_mipi_dsi: Implement host transfers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250522/202505221231.A6G8HqGd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221231.A6G8HqGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221231.A6G8HqGd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c: In function 'rzg2l_mipi_dsi_read_response':
>> drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:684:20: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     684 |         datatype = FIELD_GET(RXRSS0R_DT, result);
         |                    ^~~~~~~~~
   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c: In function 'rzg2l_mipi_dsi_host_transfer':
>> drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:742:26: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     742 |                 value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NON_READ);
         |                          ^~~~~~~~~~


vim +/FIELD_GET +684 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

   661	
   662	static ssize_t rzg2l_mipi_dsi_read_response(struct rzg2l_mipi_dsi *dsi,
   663						    const struct mipi_dsi_msg *msg)
   664	{
   665		u8 *msg_rx = msg->rx_buf;
   666		u16 size;
   667		u8 datatype;
   668		u32 result;
   669	
   670		result = rzg2l_mipi_dsi_link_read(dsi, RXRSS0R);
   671		if (result & RXRSS0R_RXPKTDFAIL) {
   672			dev_err(dsi->dev, "packet rx data did not save correctly\n");
   673			return -EPROTO;
   674		}
   675	
   676		if (result & RXRSS0R_RXFAIL) {
   677			dev_err(dsi->dev, "packet rx failure\n");
   678			return -EPROTO;
   679		}
   680	
   681		if (!(result & RXRSS0R_RXSUC))
   682			return -EPROTO;
   683	
 > 684		datatype = FIELD_GET(RXRSS0R_DT, result);
   685	
   686		switch (datatype) {
   687		case 0:
   688			dev_dbg(dsi->dev, "ACK\n");
   689			return 0;
   690		case MIPI_DSI_RX_END_OF_TRANSMISSION:
   691			dev_dbg(dsi->dev, "EoTp\n");
   692			return 0;
   693		case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
   694			dev_dbg(dsi->dev, "Acknowledge and error report: $%02x%02x\n",
   695				(u8)FIELD_GET(RXRSS0R_DATA1, result),
   696				(u8)FIELD_GET(RXRSS0R_DATA0, result));
   697			return 0;
   698		case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_1BYTE:
   699		case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_1BYTE:
   700			msg_rx[0] = FIELD_GET(RXRSS0R_DATA0, result);
   701			return 1;
   702		case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_2BYTE:
   703		case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
   704			msg_rx[0] = FIELD_GET(RXRSS0R_DATA0, result);
   705			msg_rx[1] = FIELD_GET(RXRSS0R_DATA1, result);
   706			return 2;
   707		case MIPI_DSI_RX_GENERIC_LONG_READ_RESPONSE:
   708		case MIPI_DSI_RX_DCS_LONG_READ_RESPONSE:
   709			size = FIELD_GET(RXRSS0R_WC, result);
   710	
   711			if (size > msg->rx_len) {
   712				dev_err(dsi->dev, "rx buffer too small");
   713				return -ENOSPC;
   714			}
   715	
   716			memcpy(msg_rx, dsi->dcs_buf_virt, size);
   717			return size;
   718		default:
   719			dev_err(dsi->dev, "unhandled response type: %02x\n", datatype);
   720			return -EPROTO;
   721		}
   722	}
   723	
   724	static ssize_t rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
   725						    const struct mipi_dsi_msg *msg)
   726	{
   727		struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
   728		struct mipi_dsi_packet packet;
   729		bool need_bta;
   730		u32 value;
   731		int ret;
   732	
   733		ret = mipi_dsi_create_packet(&packet, msg);
   734		if (ret < 0)
   735			return ret;
   736	
   737		/* Terminate operation after this descriptor is finished */
   738		value = SQCH0DSC0AR_NXACT_TERM;
   739	
   740		if (msg->flags & MIPI_DSI_MSG_REQ_ACK) {
   741			need_bta = true; /* Message with explicitly requested ACK */
 > 742			value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NON_READ);
   743		} else if (msg->rx_buf && msg->rx_len > 0) {
   744			need_bta = true; /* Read request */
   745			value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_READ);
   746		} else {
   747			need_bta = false;
   748			value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NONE);
   749		}
   750	
   751		/* Set transmission speed */
   752		if (msg->flags & MIPI_DSI_MSG_USE_LPM)
   753			value |= SQCH0DSC0AR_SPD_LOW;
   754		else
   755			value |= SQCH0DSC0AR_SPD_HIGH;
   756	
   757		/* Write TX packet header */
   758		value |= FIELD_PREP(SQCH0DSC0AR_DT, packet.header[0]) |
   759			FIELD_PREP(SQCH0DSC0AR_DATA0, packet.header[1]) |
   760			FIELD_PREP(SQCH0DSC0AR_DATA1, packet.header[2]);
   761	
   762		if (mipi_dsi_packet_format_is_long(msg->type)) {
   763			value |= SQCH0DSC0AR_FMT_LONG;
   764	
   765			if (packet.payload_length > RZG2L_DCS_BUF_SIZE) {
   766				dev_err(dsi->dev, "Packet Tx payload size (%d) too large",
   767					(unsigned int)packet.payload_length);
   768				return -ENOSPC;
   769			}
   770	
   771			/* Copy TX packet payload data to memory space */
   772			memcpy(dsi->dcs_buf_virt, packet.payload, packet.payload_length);
   773		} else {
   774			value |= SQCH0DSC0AR_FMT_SHORT;
   775		}
   776	
   777		rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);
   778	
   779		/*
   780		 * Write: specify payload data source location, only used for
   781		 *        long packet.
   782		 * Read:  specify payload data storage location of response
   783		 *        packet. Note: a read packet is always a short packet.
   784		 *        If the response packet is a short packet or a long packet
   785		 *        with WC = 0 (no payload), DTSEL is meaningless.
   786		 */
   787		rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0BR, SQCH0DSC0BR_DTSEL_MEM_SPACE);
   788	
   789		/*
   790		 * Set SQCHxSR.AACTFIN bit when descriptor actions are finished.
   791		 * Read: set Rx result save slot number to 0 (ACTCODE).
   792		 */
   793		rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0CR, SQCH0DSC0CR_FINACT);
   794	
   795		/* Set rx/tx payload data address, only relevant for long packet. */
   796		rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0DR, (u32)dsi->dcs_buf_phys);
   797	
   798		/* Start sequence 0 operation */
   799		value = rzg2l_mipi_dsi_link_read(dsi, SQCH0SET0R);
   800		value |= SQCH0SET0R_START;
   801		rzg2l_mipi_dsi_link_write(dsi, SQCH0SET0R, value);
   802	
   803		/* Wait for operation to finish */
   804		ret = read_poll_timeout(rzg2l_mipi_dsi_link_read,
   805					value, value & SQCH0SR_ADESFIN,
   806					2000, 20000, false, dsi, SQCH0SR);
   807		if (ret == 0) {
   808			/* Success: clear status bit */
   809			rzg2l_mipi_dsi_link_write(dsi, SQCH0SCR, SQCH0SCR_ADESFIN);
   810	
   811			if (need_bta)
   812				ret = rzg2l_mipi_dsi_read_response(dsi, msg);
   813			else
   814				ret = packet.payload_length;
   815		}
   816	
   817		return ret;
   818	}
   819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
