Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246161F191B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 14:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E826E4D4;
	Mon,  8 Jun 2020 12:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9726E4DD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 12:51:44 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058CktmJ031202;
 Mon, 8 Jun 2020 12:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=JDcagXN5IWgnkWEj/jglT9oGKYFcCwv8Ecb8T8hrDIM=;
 b=nwOoyph2HIYkEkWJ47UFPHLPrmmZGFrF7oO8k0qKJrcMrbN7KDjj5f1RPICGeSa2AyfN
 gIcLtqGpPhSszIMurJjPuG+tTJOk3zkypo3YWe9yGfXbH9k9uOGZTcNsjVcJWd5/Kw+b
 jEgnfd352G2nzwEUe0KJGPkGeMkfoTezrsWC6zSRIuGOgZL3YlOIPhcJJClewe5MgLCk
 oBZiw/EbTZ+m+dS2ewtVUg54gTeZE+x8X1gcvtdBnP2wxIHUmNTCdHXqCJPxg6KWo6e1
 AK7NsQ6Bh9IfDehcEeLGciHyqdbn5cO5Fc2DhZQ/7GCfmp88d+CKmWbUZioWTjpJWcFe Vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 31g33kxpuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 08 Jun 2020 12:51:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058CmKgC002344;
 Mon, 8 Jun 2020 12:51:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 31gmwpw71j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jun 2020 12:51:38 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 058CpaHM028413;
 Mon, 8 Jun 2020 12:51:36 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jun 2020 05:51:35 -0700
Date: Mon, 8 Jun 2020 15:51:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
Message-ID: <20200608125127.GN22511@kadam>
References: <20200608115155.GY30374@kadam>
 <b347fb60-46d3-e59c-59fa-a2b10932fc49@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b347fb60-46d3-e59c-59fa-a2b10932fc49@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006080095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 cotscore=-2147483648 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006080095
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kbuild@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cw00.choi@samsung.com, linux-mediatek@lists.infradead.org, linux-imx@nxp.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 08, 2020 at 01:34:37PM +0100, Lukasz Luba wrote:
> Hi Dan,
> 
> Thank you for your analyzes.
> 
> On 6/8/20 12:51 PM, Dan Carpenter wrote:
> > Hi Lukasz,
> > 
> > I love your patch! Perhaps something to improve:
> > 
> > url:    https://github.com/0day-ci/linux/commits/Lukasz-Luba/Add-support-for-devices-in-the-Energy-Model/20200527-180614
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> > 
> > config: i386-randconfig-m021-20200605 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > smatch warnings:
> > kernel/power/energy_model.c:316 em_dev_register_perf_domain() error: we previously assumed 'dev->em_pd' could be null (see line 277)
> > 
> > # https://github.com/0day-ci/linux/commit/110d050cb7ba1c96e63ada498979d1fd99529be2
> > git remote add linux-review https://github.com/0day-ci/linux
> > git remote update linux-review
> > git checkout 110d050cb7ba1c96e63ada498979d1fd99529be2
> > vim +316 kernel/power/energy_model.c
> > 
> > 0e294e607adaf3 Lukasz Luba     2020-05-27  262  int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  263  				struct em_data_callback *cb, cpumask_t *cpus)
> > 27871f7a8a341e Quentin Perret  2018-12-03  264  {
> > 27871f7a8a341e Quentin Perret  2018-12-03  265  	unsigned long cap, prev_cap = 0;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  266  	int cpu, ret;
> > 27871f7a8a341e Quentin Perret  2018-12-03  267
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  268  	if (!dev || !nr_states || !cb)
> > 27871f7a8a341e Quentin Perret  2018-12-03  269  		return -EINVAL;
> > 27871f7a8a341e Quentin Perret  2018-12-03  270
> > 27871f7a8a341e Quentin Perret  2018-12-03  271  	/*
> > 27871f7a8a341e Quentin Perret  2018-12-03  272  	 * Use a mutex to serialize the registration of performance domains and
> > 27871f7a8a341e Quentin Perret  2018-12-03  273  	 * let the driver-defined callback functions sleep.
> > 27871f7a8a341e Quentin Perret  2018-12-03  274  	 */
> > 27871f7a8a341e Quentin Perret  2018-12-03  275  	mutex_lock(&em_pd_mutex);
> > 27871f7a8a341e Quentin Perret  2018-12-03  276
> > 110d050cb7ba1c Lukasz Luba     2020-05-27 @277  	if (dev->em_pd) {
> >                                                              ^^^^^^^^^^
> > Check for NULL.
> > 
> > 27871f7a8a341e Quentin Perret  2018-12-03  278  		ret = -EEXIST;
> > 27871f7a8a341e Quentin Perret  2018-12-03  279  		goto unlock;
> > 27871f7a8a341e Quentin Perret  2018-12-03  280  	}
> > 27871f7a8a341e Quentin Perret  2018-12-03  281
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  282  	if (_is_cpu_device(dev)) {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  283  		if (!cpus) {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  284  			dev_err(dev, "EM: invalid CPU mask\n");
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  285  			ret = -EINVAL;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  286  			goto unlock;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  287  		}
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  288
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  289  		for_each_cpu(cpu, cpus) {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  290  			if (em_cpu_get(cpu)) {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  291  				dev_err(dev, "EM: exists for CPU%d\n", cpu);
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  292  				ret = -EEXIST;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  293  				goto unlock;
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  294  			}
> > 27871f7a8a341e Quentin Perret  2018-12-03  295  			/*
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  296  			 * All CPUs of a domain must have the same
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  297  			 * micro-architecture since they all share the same
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  298  			 * table.
> > 27871f7a8a341e Quentin Perret  2018-12-03  299  			 */
> > 8ec59c0f5f4966 Vincent Guittot 2019-06-17  300  			cap = arch_scale_cpu_capacity(cpu);
> > 27871f7a8a341e Quentin Perret  2018-12-03  301  			if (prev_cap && prev_cap != cap) {
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  302  				dev_err(dev, "EM: CPUs of %*pbl must have the same capacity\n",
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  303  					cpumask_pr_args(cpus));
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  304
> > 27871f7a8a341e Quentin Perret  2018-12-03  305  				ret = -EINVAL;
> > 27871f7a8a341e Quentin Perret  2018-12-03  306  				goto unlock;
> > 27871f7a8a341e Quentin Perret  2018-12-03  307  			}
> > 27871f7a8a341e Quentin Perret  2018-12-03  308  			prev_cap = cap;
> > 27871f7a8a341e Quentin Perret  2018-12-03  309  		}
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  310  	}
> > 27871f7a8a341e Quentin Perret  2018-12-03  311
> > 110d050cb7ba1c Lukasz Luba     2020-05-27  312  	ret = em_create_pd(dev, nr_states, cb, cpus);
> > 
> > 
> > If it's a _is_cpu_device() then it iterates through a bunch of devices
> > and sets up cpu_dev->em_pd for each.  Presumably one of the devices is
> > "dev" or this would crash pretty early on in testing?
> 
> Yes, all of the devices taken from 'cpus' mask will get the em_pd set
> including the suspected @dev.
> To calm down this static analyzer I can remove the 'else'
> in line 204 to make 'dev->em_pd = pd' set always.
> 199         if (_is_cpu_device(dev))
> 200                 for_each_cpu(cpu, cpus) {
> 201                         cpu_dev = get_cpu_device(cpu);
> 202                         cpu_dev->em_pd = pd;
> 203                 }
> 204         else
> 205                 dev->em_pd = pd;
> 
> 
> Do you think it's a good solution and will work for this tool?

It's not about the tool...  Ignore the tool when it's wrong.  But I do
think the code is slightly more clear without the else statement.

Arguments could be made either way.  Removing the else statement means
we set dev->em_pd twice...  But I *personally* lean vaguely towards
removing the else statement.  :P

That would make the warning go away as well.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
