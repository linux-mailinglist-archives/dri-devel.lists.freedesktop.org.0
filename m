Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9173B3529DE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 12:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797CF6E090;
	Fri,  2 Apr 2021 10:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943A16E090;
 Fri,  2 Apr 2021 10:44:05 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 132Ag2Kf063555;
 Fri, 2 Apr 2021 10:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=qWi4S5gWooFATM7v4rCSkRICY7sbJIDevIPiWiSV6vQ=;
 b=BaK8Odt5wrhgHEbXP3jA23QU7kLN7NvCm+SLMjcAi4qcfREgmhZaM91rEkm4AK83gmQy
 y5u3HW5jky8YAvgt58P1D1WmcVFhPk7eqQhDlSJxTJMJ56JUFjL2JkjPsf8gLdpaqNVL
 tLaTYL6cS2n18crK6eoxX3VLVEMo/OewQ4leadQHZBTGKL3nK2B5jJHa3CIMotwnKosF
 FjZ4KjP4PMH/E/IhBNK3qBfqeg99ueQMrxttR/vHypSq1oKuwILigCrOR7ohFv4FQKAS
 /KXzqSnof6OVoF6niuS8PXtp0fTseVNlVj5nhluov+W26OEGerXnaqKlvB40f8b2fgdP hA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 37n2a04d74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Apr 2021 10:44:00 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 132AZdlv093820;
 Fri, 2 Apr 2021 10:43:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 37n2atxf92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Apr 2021 10:43:59 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 132AhvPu028804;
 Fri, 2 Apr 2021 10:43:58 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Apr 2021 10:43:56 +0000
Date: Fri, 2 Apr 2021 13:43:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [drm-intel:drm-intel-next 3/4]
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c:582 intel_dp_hdcp2_read_msg()
 error: uninitialized symbol 'msg_end'.
Message-ID: <20210402104348.GW2065@kadam>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5uO961YFyoDlzFnP"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020076
X-Proofpoint-GUID: hB4qa5d8yHuBFuxP9V6OtLVRIaAYuBJF
X-Proofpoint-ORIG-GUID: hB4qa5d8yHuBFuxP9V6OtLVRIaAYuBJF
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0
 clxscore=1011 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020076
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5uO961YFyoDlzFnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next
head:   b29854ec3b9ca6512a783e2153465f27a777a654
commit: 989cf9a93892409cf8e84c30c0faaa522ac83807 [3/4] drm/i915/hdcp: Add DP HDCP2.2 timeout to read entire msg
config: i386-randconfig-m031-20210401 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/display/intel_dp_hdcp.c:582 intel_dp_hdcp2_read_msg() error: uninitialized symbol 'msg_end'.

vim +/msg_end +582 drivers/gpu/drm/i915/display/intel_dp_hdcp.c

d079b7e4b6389e Sean Paul      2020-08-18  526  static
d079b7e4b6389e Sean Paul      2020-08-18  527  int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
d079b7e4b6389e Sean Paul      2020-08-18  528  			    u8 msg_id, void *buf, size_t size)
d079b7e4b6389e Sean Paul      2020-08-18  529  {
d079b7e4b6389e Sean Paul      2020-08-18  530  	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
d079b7e4b6389e Sean Paul      2020-08-18  531  	unsigned int offset;
d079b7e4b6389e Sean Paul      2020-08-18  532  	u8 *byte = buf;
d079b7e4b6389e Sean Paul      2020-08-18  533  	ssize_t ret, bytes_to_recv, len;
d079b7e4b6389e Sean Paul      2020-08-18  534  	const struct hdcp2_dp_msg_data *hdcp2_msg_data;
989cf9a9389240 Anshuman Gupta 2021-03-24  535  	ktime_t msg_end;
                                                ^^^^^^^^^^^^^^^^

989cf9a9389240 Anshuman Gupta 2021-03-24  536  	bool msg_expired;
d079b7e4b6389e Sean Paul      2020-08-18  537  
d079b7e4b6389e Sean Paul      2020-08-18  538  	hdcp2_msg_data = get_hdcp2_dp_msg_data(msg_id);
d079b7e4b6389e Sean Paul      2020-08-18  539  	if (!hdcp2_msg_data)
d079b7e4b6389e Sean Paul      2020-08-18  540  		return -EINVAL;
d079b7e4b6389e Sean Paul      2020-08-18  541  	offset = hdcp2_msg_data->offset;
d079b7e4b6389e Sean Paul      2020-08-18  542  
d079b7e4b6389e Sean Paul      2020-08-18  543  	ret = intel_dp_hdcp2_wait_for_msg(dig_port, hdcp2_msg_data);
d079b7e4b6389e Sean Paul      2020-08-18  544  	if (ret < 0)
d079b7e4b6389e Sean Paul      2020-08-18  545  		return ret;
d079b7e4b6389e Sean Paul      2020-08-18  546  
d079b7e4b6389e Sean Paul      2020-08-18  547  	if (msg_id == HDCP_2_2_REP_SEND_RECVID_LIST) {
d079b7e4b6389e Sean Paul      2020-08-18  548  		ret = get_receiver_id_list_size(dig_port);
d079b7e4b6389e Sean Paul      2020-08-18  549  		if (ret < 0)
d079b7e4b6389e Sean Paul      2020-08-18  550  			return ret;
d079b7e4b6389e Sean Paul      2020-08-18  551  
d079b7e4b6389e Sean Paul      2020-08-18  552  		size = ret;
d079b7e4b6389e Sean Paul      2020-08-18  553  	}
d079b7e4b6389e Sean Paul      2020-08-18  554  	bytes_to_recv = size - 1;
                                                ^^^^^^^^^^^^^^^^^^^^^^^^
Is it possible to for "size" to be 1?

d079b7e4b6389e Sean Paul      2020-08-18  555  
d079b7e4b6389e Sean Paul      2020-08-18  556  	/* DP adaptation msgs has no msg_id */
d079b7e4b6389e Sean Paul      2020-08-18  557  	byte++;
d079b7e4b6389e Sean Paul      2020-08-18  558  
d079b7e4b6389e Sean Paul      2020-08-18  559  	while (bytes_to_recv) {

In that case, we would never enter this loop.

d079b7e4b6389e Sean Paul      2020-08-18  560  		len = bytes_to_recv > DP_AUX_MAX_PAYLOAD_BYTES ?
d079b7e4b6389e Sean Paul      2020-08-18  561  		      DP_AUX_MAX_PAYLOAD_BYTES : bytes_to_recv;
d079b7e4b6389e Sean Paul      2020-08-18  562  
989cf9a9389240 Anshuman Gupta 2021-03-24  563  		/* Entire msg read timeout since initiate of msg read */
989cf9a9389240 Anshuman Gupta 2021-03-24  564  		if (bytes_to_recv == size - 1 && hdcp2_msg_data->msg_read_timeout > 0)
989cf9a9389240 Anshuman Gupta 2021-03-24  565  			msg_end = ktime_add_ms(ktime_get_raw(),
989cf9a9389240 Anshuman Gupta 2021-03-24  566  					       hdcp2_msg_data->msg_read_timeout);
989cf9a9389240 Anshuman Gupta 2021-03-24  567  
d079b7e4b6389e Sean Paul      2020-08-18  568  		ret = drm_dp_dpcd_read(&dig_port->dp.aux, offset,
d079b7e4b6389e Sean Paul      2020-08-18  569  				       (void *)byte, len);
d079b7e4b6389e Sean Paul      2020-08-18  570  		if (ret < 0) {
d079b7e4b6389e Sean Paul      2020-08-18  571  			drm_dbg_kms(&i915->drm, "msg_id %d, ret %zd\n",
d079b7e4b6389e Sean Paul      2020-08-18  572  				    msg_id, ret);
d079b7e4b6389e Sean Paul      2020-08-18  573  			return ret;
d079b7e4b6389e Sean Paul      2020-08-18  574  		}
d079b7e4b6389e Sean Paul      2020-08-18  575  
d079b7e4b6389e Sean Paul      2020-08-18  576  		bytes_to_recv -= ret;
d079b7e4b6389e Sean Paul      2020-08-18  577  		byte += ret;
d079b7e4b6389e Sean Paul      2020-08-18  578  		offset += ret;
d079b7e4b6389e Sean Paul      2020-08-18  579  	}
989cf9a9389240 Anshuman Gupta 2021-03-24  580  
989cf9a9389240 Anshuman Gupta 2021-03-24  581  	if (hdcp2_msg_data->msg_read_timeout > 0) {
989cf9a9389240 Anshuman Gupta 2021-03-24 @582  		msg_expired = ktime_after(ktime_get_raw(), msg_end);
989cf9a9389240 Anshuman Gupta 2021-03-24  583  		if (msg_expired) {
989cf9a9389240 Anshuman Gupta 2021-03-24  584  			drm_dbg_kms(&i915->drm, "msg_id %d, entire msg read timeout(mSec): %d\n",
989cf9a9389240 Anshuman Gupta 2021-03-24  585  				    msg_id, hdcp2_msg_data->msg_read_timeout);
989cf9a9389240 Anshuman Gupta 2021-03-24  586  			return -ETIMEDOUT;
989cf9a9389240 Anshuman Gupta 2021-03-24  587  		}
989cf9a9389240 Anshuman Gupta 2021-03-24  588  	}
989cf9a9389240 Anshuman Gupta 2021-03-24  589  
d079b7e4b6389e Sean Paul      2020-08-18  590  	byte = buf;
d079b7e4b6389e Sean Paul      2020-08-18  591  	*byte = msg_id;
d079b7e4b6389e Sean Paul      2020-08-18  592  
d079b7e4b6389e Sean Paul      2020-08-18  593  	return size;
d079b7e4b6389e Sean Paul      2020-08-18  594  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--5uO961YFyoDlzFnP
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
XnPRXKBo32rvoBQSxEJQRnz/B6e4tGKB3QEA

--5uO961YFyoDlzFnP
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--5uO961YFyoDlzFnP--
